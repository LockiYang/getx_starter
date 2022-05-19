import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/modules/app_job/data/repositorys/job_api.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../data/models/post.dart';
import '../data/models/post_list.dart';

class JobHomeController extends GetxController
    with GetTickerProviderStateMixin {
  late JobApi jobApi;
  var bannerUrlList = <String>[];

  int tabIndex = 0;
  var tabs = <Post_list>[];
  var tabsData = <int, List<Post>>{};

  late TabController tabController;
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  late ScrollController scrollController;

  refreshData() {}
  loadingData() {}

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
    jobApi = Get.find<JobApi>();
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          print('滑动到了最底部');
        }
      });
  }

  @override
  void onReady() {
    super.onReady();
    jobApi.getBanners(success: ((data) {
      debugPrint(data.toString());
      for (var banner in data) {
        bannerUrlList.add(banner.imageUrl);
      }
      update();
    }));
    jobApi.getCategory(success: ((data) {
      for (var item in data) {
        if (item.type == 1) {
          tabs.add(item);
        }
      }
      tabController = TabController(length: tabs.length, vsync: this)
        ..addListener(() {
          tabIndex = tabController.index;
          // jobApi.getPostPage(tabs[tabIndex].id.toInt(), success: (data) {
          //   tabsData[tabIndex] = data;
          //   update();
          // });
          update();
        });
      update();
      jobApi.getPostPage(tabs[0].id.toInt(), success: (data) {
        tabsData[0] = data;
        update();
      });
    }));
  }

  @override
  void onClose() {}
}
