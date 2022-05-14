import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_home/wa_home_view.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_my/wa_my_view.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_project/wa_project_view.dart';

class TestWanandroidController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var currentIndex = 0;

  final List<Widget> navbarBodys = [
    WaHomeView(),
    WaProjectView(),
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
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
