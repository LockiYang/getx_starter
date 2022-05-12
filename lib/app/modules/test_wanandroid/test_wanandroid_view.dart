import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

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
  }
}
