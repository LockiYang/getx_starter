import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/common/utils/toast_util.dart';
import 'package:getx_test/app/modules/app_job/data/repositorys/job_api.dart';

import '../data/models/post.dart';
import '../data/models/post_list.dart';

class JobHomeController extends GetxController
    with GetTickerProviderStateMixin {
  var bannerUrlList = <String>[];

  int tabIndex = 0;
  var tabs = <Post_list>[];
  var tabsData = <int, List<Post>>{};
  var currentPages = <int, int>{};
  var totalPages = <int, int>{};
  // 加载状态: 0加载中 1加载成功 2加载数据为空 3加载失败
  int loadStatus = 0;
  bool hasMore = true;

  late JobApi jobApi;
  late TabController tabController;
  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
    jobApi = Get.find<JobApi>();
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          if (currentPages[tabIndex]! < totalPages[tabIndex]!) {
            currentPages[tabIndex] = currentPages[tabIndex]! + 1;
            loadStatus = 0;
            // 加载数据
            // _getMoreData();
          } else {
            hasMore = false;
          }
          update();
        }
      });
  }

  @override
  void onReady() {
    super.onReady();
    refreshData();
  }

  @override
  void onClose() {
    tabController.dispose();
    scrollController.dispose();
  }

  Future<void> refreshData() async {
    jobApi.getBanners(success: ((data) {
      bannerUrlList.clear();
      for (var banner in data) {
        bannerUrlList.add(banner.imageUrl);
      }
      update();
    }));
    jobApi.getCategory(success: ((data) {
      tabs.clear();
      int i = 0;
      for (var item in data) {
        if (item.type == 1) {
          tabs.add(item);
          tabsData[i] = [];
          currentPages[i] = 1;
          totalPages[i] = 1;
          ++i;
        }
      }
      update();
      tabController = TabController(
          initialIndex: tabIndex, length: tabs.length, vsync: this)
        ..addListener(() {
          tabIndex = tabController.index;
          jobApi.getPostPage(
              tabs[tabIndex].id.toInt(), currentPages[tabIndex] ?? 1,
              success: (data, page) {
            tabsData[tabIndex] = data;
            loadStatus = 1;
            update();
          });
        });
      jobApi.getPostPage(tabs[tabIndex].id.toInt(), currentPages[tabIndex] ?? 1,
          success: (data, page) {
        tabsData[0] = data;
        loadStatus = 1;
        update();
        ToastUtil.show('刷新成功');
      });
    }));
  }

  Future<void> loadingData() async {}

  bool isListEmpty(List? list) {
    if (list == null || list.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
