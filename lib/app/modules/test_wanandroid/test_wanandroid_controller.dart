import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_home/wa_home_view.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_my/wa_my_view.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_project/wa_project_view.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_video/wa_video_view.dart';

class TestWanandroidController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var currentIndex = 0;
  DateTime? lastPopTime;

  final List<Widget> navbarBodys = [
    WaHomeView(),
    WaProjectView(),
    WaVideoView(),
    WaMyView()
  ];

  late PageController pageController;

  setIndex(i) {
    currentIndex = i;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentIndex);
    pageController.addListener(() {
      var index = pageController.page;
      /// 进入我的页面，更新页面数据
      if ( index == navbarBodys.length - 1) {
        debugPrint('update my page');
        // Get.find<WaMyController>().notifyUserInfo();
      }
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
