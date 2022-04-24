import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnrollController extends GetxController with GetSingleTickerProviderStateMixin {

  final List<Tab> myTabs = <Tab>[
    Tab(text: '全部',),
    Tab(text: '已报名',),
    Tab(text: '已录取',),
    Tab(text: '已结束',)
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
