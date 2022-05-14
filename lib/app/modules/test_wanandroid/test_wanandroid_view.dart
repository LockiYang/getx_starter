import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'test_wanandroid_controller.dart';

/// App主体Tab框架
/// 1. BottomNavigationBar + PageView => 保持状态：AutomaticKeepAliveClientMixin
/// 2. TabBar + TabBarView（PageView的封装） => 保持状态：AutomaticKeepAliveClientMixin
///   AutomaticKeepAliveClientMixin保持状态的原理：StatefulWidget不会dispose，Getx组件不会onClose，生命周期不会结束
/// 另一种保持状态的方式：IndexedStack
class TestWanandroidView extends GetView<TestWanandroidController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestWanandroidController>(
      builder: (controller) => Scaffold(
        body: PageView(
          children: controller.navbarBodys,
          controller: controller.pageController,
          physics: NeverScrollableScrollPhysics(), //禁止滑动
          onPageChanged: (index) => controller
            ..currentIndex = index
            ..update(),
        ),
        bottomNavigationBar: BrnBottomTabBar(
          currentIndex: controller.currentIndex,
          onTap: (index) {
            controller.setIndex(index);
            controller.pageController.jumpToPage(index);
          },
          items: [
            BrnBottomTabBarItem(
              icon: Icon(Icons.turned_in),
              title: Text('首页'),
            ),
            BrnBottomTabBarItem(icon: Icon(Icons.send), title: Text('项目')),
            BrnBottomTabBarItem(icon: Icon(Icons.person), title: Text('我的')),
          ],
        ),
      ),
    );
  }
}
