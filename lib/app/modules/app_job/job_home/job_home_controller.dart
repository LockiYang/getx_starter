import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobHomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var bannerUrlList = <String>[
    'assets/images/banner01.png',
    'assets/images/banner01.png'
  ];

  var tabs = <Widget>[
    Tab(text: "需求1"),
    Tab(text: "需求1"),
    Tab(text: "需求1"),
    Tab(text: "需求1"),
    Tab(text: "需求1"),
  ];

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
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
