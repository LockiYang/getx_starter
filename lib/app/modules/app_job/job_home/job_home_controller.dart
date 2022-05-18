import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobHomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var bannerUrlList = <String>[
    'assets/images/banner01.png',
    'assets/images/banner01.png'
  ];

  int tabIndex = 0;

  var tabs = ['推荐兼职', '在家做', '技能兼职', '在线课程', '手机兼职'];

  final List<Color> colorList = [
    Colors.red,
    Colors.orange,
    Colors.green,
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.pink,
    Colors.teal,
    Colors.deepPurpleAccent
  ];

  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
    // ..addListener(() {
    //   tabIndex = tabController.index;
    //   update();
    // });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
