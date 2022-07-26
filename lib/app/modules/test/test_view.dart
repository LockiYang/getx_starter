import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import 'test_controller.dart';

class TestView extends GetView<TestController> {
  @override
  Widget build(BuildContext context) {
    // ScreenUtil.removeStatusBarTransparent(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          bottom: false,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BrnActionCardTitle(
                    title: '基础组件',
                    onTap: () => Get.toNamed(Routes.BASIC_WIDGETS),
                  ),
                  BrnActionCardTitle(
                    title: '自定义图标',
                    onTap: () => Get.toNamed(Routes.CUSTOM_ICON),
                  ),
                  BrnActionCardTitle(
                    title: 'ListView',
                    onTap: () => Get.toNamed(Routes.LIST_VIEW),
                  ),
                  BrnActionCardTitle(
                    title: 'GridView',
                    onTap: () => Get.toNamed(Routes.GRID_VIEW),
                  ),
                  BrnActionCardTitle(
                    title: 'Sliver系列组件',
                    onTap: () => Get.toNamed(Routes.SLIVER_WIDGETS),
                  ),
                  BrnActionCardTitle(
                    title: 'News APP',
                    onTap: () => Get.toNamed(Routes.TEST_NEWS),
                  ),
                  BrnActionCardTitle(
                    title: 'WanAndroid APP',
                    onTap: () => Get.toNamed(Routes.TEST_WANANDROID),
                  ),
                  BrnActionCardTitle(
                    title: '小组件',
                    onTap: () => Get.toNamed(Routes.LITTLE_WIDGETS),
                  ),
                  BrnActionCardTitle(
                    title: 'Device Info',
                    onTap: () => Get.toNamed(Routes.DEVICE_INFO),
                  ),
                  BrnActionCardTitle(
                    title: 'CITY',
                    onTap: () => Get.toNamed(Routes.CITY),
                  ),
                  BrnActionCardTitle(
                    title: 'SEARCH',
                    onTap: () => Get.toNamed(Routes.SEARCH),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
