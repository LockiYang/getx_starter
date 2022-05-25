import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/modules/app_job/data/repositorys/job_api.dart';

import '../data/models/pagination.dart';
import '../data/models/post.dart';
import '../data/models/post_list.dart';

class JobHomeController extends GetxController
    with GetTickerProviderStateMixin {
  var bannerUrlList = <String>[];
  var adBannerUrlList = <String>[];

  int tabIndex = 0;
  var tabs = <Post_list>[];
  var dataList = <int, List<Post>>{};
  var currentPageList = <int, int>{};
  var totalPageList = <int, int>{};
  var loadStatusList = <int, int>{}; // 加载状态: 0加载中 1加载成功 2加载数据为空 3加载失败
  var hasMoreList = <int, bool>{};

  late TabController tabController;
  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          // 下拉刷新
          if (hasMoreList[tabIndex]!) {
            // 有数据
            currentPageList[tabIndex] = currentPageList[tabIndex]! + 1;
            loadStatusList[tabIndex] = 0;
            // 加载数据
            loadPostData();
          }
        }
      });
  }

  @override
  void onReady() {
    super.onReady();
    refreshPage();
  }

  @override
  void onClose() {
    tabController.dispose();
    scrollController.dispose();
  }

  Future<void> refreshPage() async {
    hasMoreList[tabIndex] = true;
    loadStatusList[tabIndex] = 0;
    JobApi.to.getBanners('HOME', success: ((data) {
      bannerUrlList.clear();
      for (var banner in data) {
        bannerUrlList.add(banner.imageUrl);
      }
      update();
    }));
    JobApi.to.getBanners('HOME_AD', success: ((data) {
      adBannerUrlList.clear();
      for (var banner in data) {
        adBannerUrlList.add(banner.imageUrl);
      }
      update();
    }));
    JobApi.to.getCategory(success: ((data) {
      tabs.clear();
      int i = 0;
      for (var item in data) {
        if (item.type == 1) {
          tabs.add(item);
          dataList[i] = [];
          currentPageList[i] = 1;
          totalPageList[i] = 1;
          loadStatusList[i] = 1;
          hasMoreList[i] = true;
          i++;
        }
      }
      update();
      tabController = TabController(
          initialIndex: tabIndex, length: tabs.length, vsync: this)
        ..addListener(() async {
          // 刷新列表数据
          tabIndex = tabController.index;
          if (dataList[tabIndex]!.isEmpty) {
            await loadPostData();
          }
        });
      loadPostData();
    }));
  }

  Future<List<Post>> loadPostData() async {
    Pagination<Post> result = await JobApi.to
        .getPostPage(tabs[tabIndex].id.toInt(), currentPageList[tabIndex]!);
    if (result.pageNum < result.pages) {
      hasMoreList[tabIndex] = true;
    } else {
      hasMoreList[tabIndex] = false;
    }
    totalPageList[tabIndex] = result.total;
    dataList[tabIndex]!.addAll(result.data);
    loadStatusList[tabIndex] = 1;
    update();
    return result.data;
  }

  bool isListEmpty(List? list) {
    if (list == null || list.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
