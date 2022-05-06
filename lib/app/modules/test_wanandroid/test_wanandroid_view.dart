import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'test_wanandroid_controller.dart';

class TestWanandroidView extends GetView<TestWanandroidController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.navbarBodyItems[controller.curNavIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: controller.curNavIndex.value,
            onTap: (index) {
              controller.curNavIndex.value = index;
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.turned_in), label: '首页'),
              BottomNavigationBarItem(icon: Icon(Icons.send), label: '项目'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: '我的')
            ],
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12.0,
            unselectedFontSize: 12.0,
            selectedItemColor: Get.theme.colorScheme.primary,
            unselectedItemColor: Get.theme.colorScheme.secondary,
          )),
    );
  }
}
