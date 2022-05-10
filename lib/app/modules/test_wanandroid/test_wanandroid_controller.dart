import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_home/wa_home_view.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_my/wa_my_view.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_project/wa_project_view.dart';

class TestWanandroidController extends GetxController {
  
  var curNavIndex = 0.obs;
  final List<Widget> navbarBodyItems = [WaHomeView(), WaProjectView(), WaMyView()];
  
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
