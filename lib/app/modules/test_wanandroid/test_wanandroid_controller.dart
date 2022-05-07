import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_project/wa_project_view.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_project/wa_project_view2.dart';

import '../my/my_view.dart';

class TestWanandroidController extends GetxController {
  
  var curNavIndex = 0.obs;
  final List<Widget> navbarBodyItems = [WaProjectView2(), WaProjectView(), MyView()];
  
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
