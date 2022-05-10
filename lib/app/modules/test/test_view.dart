import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../utils/screen_util.dart';
import '../navbar/navbar.dart';
import 'test_controller.dart';

class TestView extends GetView<TestController> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.removeStatusBarTransparent(context);
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text('基础组件'),
              onTap: () => Get.toNamed(Routes.BASIC_WIDGETS),
            ),
            ListTile(
              title: Text('ListView'),
              onTap: () => Get.toNamed(Routes.LIST_VIEW),
            ),
            ListTile(
              title: Text('自定义图标'),
              onTap: () => Get.toNamed(Routes.CUSTOM_ICON),
            ),
            ListTile(
              title: Text('GridView'),
              onTap: () => Get.toNamed(Routes.GRID_VIEW),
            ),
            ListTile(
              title: Text('Sliver系列组件'),
              onTap: () => Get.toNamed(Routes.SLIVER_WIDGETS),
            ),
            ListTile(
              title: Text('News APP'),
              onTap: () => Get.toNamed(Routes.TEST_NEWS),
            ),
            ListTile(
              title: Text('WanAndroid APP'),
              onTap: () => Get.toNamed(Routes.TEST_WANANDROID),
            ),
            ListTile(
              title: Text('登录'),
              onTap: () => Get.toNamed(Routes.WELCOME),
            ),
            ListTile(
              title: Text('Navbar'),
              onTap: () => Get.to(Navbar()),
            ),
            ListTile(
              title: Text('闪验测试'),
              onTap: () => Get.toNamed(Routes.SHANYAN),
            ),
            ListTile(
              title: Text('小组件'),
              onTap: () => Get.toNamed(Routes.LITTLE_WIDGETS),
            ),
            ListTile(
              // title: Text('Banner', style: ThemeData.light().textTheme.displayLarge,),
              title: Text('Banner', style: Get.theme.textTheme.headline4,),
              onTap: () => Get.toNamed(Routes.BANNER_SWIPER),
            ),
            // ElevatedButton(
            //     style: ButtonStyle(
            //       overlayColor: MaterialStateProperty.all(Colors.transparent),
            //       animationDuration: const Duration(milliseconds: 200),
            //       padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
            //       shape: MaterialStateProperty.all(const StadiumBorder()),
            //       shadowColor: MaterialStateProperty.all(Colors.transparent),
            //       backgroundColor: MaterialStateProperty.all(Colors.red),
            //       // foregroundColor: MaterialStateProperty.all(Colors.green)
            //     ),
            //     onPressed: () => Get.toNamed(Routes.WELCOME),
            //     child: Text('登录')),
            // OutlinedButton(
            //     onPressed: () {
            //       Get.dialog(CommonDialog(
            //         title: '退出登录',
            //         content: '确定要退出登录',
            //         backText: '取消',
            //         nextText: '确定',
            //       ));
            //     },
            //     child: Text('Common Dialog')),
            // OutlinedButton(
            //     onPressed: () {
            //       Get.dialog(LoadingDialog());
            //     },
            //     child: Text('Loadding Dialog')),
          ],
        ),
      ),
    ));
  }
}
