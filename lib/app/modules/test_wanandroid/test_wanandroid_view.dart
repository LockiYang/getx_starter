import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/getx/getz_view.dart';
import 'test_wanandroid_controller.dart';

class TestWanandroidView extends GetzView<TestWanandroidController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.navbarBodyItems[controller.currentIndex],
      bottomNavigationBar: BrnBottomTabBar(
        // badgeColor: Colors.red,
        currentIndex: controller.currentIndex,
        onTap: (index) {
          controller.setIndex(index);
        },
        items: [
          BrnBottomTabBarItem(icon: Icon(Icons.turned_in), title: Text('首页'),),
          BrnBottomTabBarItem(icon: Icon(Icons.send), title: Text('项目')),
          BrnBottomTabBarItem(icon: Icon(Icons.person), title: Text('我的')),
        ],
      ),
    );
    // return Scaffold(
    //   body: Obx(() => controller.navbarBodyItems[controller.currentIndex.value]),
    //   bottomNavigationBar: Obx(() => BottomNavigationBar(
    //         backgroundColor: Colors.white,
    //         currentIndex: controller.currentIndex.value,
    //         onTap: (index) {
    //           controller.currentIndex.value = index;
    //         },
    //         items: [
    //           BottomNavigationBarItem(icon: Icon(Icons.turned_in), label: '首页'),
    //           BottomNavigationBarItem(icon: Icon(Icons.send), label: '项目'),
    //           BottomNavigationBarItem(
    //               icon: Icon(Icons.person), label: '我的')
    //         ],
    //         type: BottomNavigationBarType.fixed,
    //         selectedFontSize: 12.0,
    //         unselectedFontSize: 12.0,
    //         selectedItemColor: Get.theme.colorScheme.primary,
    //         unselectedItemColor: Get.theme.colorScheme.secondary,
    //       )),
    // );
  }
}
