import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/common/utils/toast_util.dart';

import 'app_job_controller.dart';

class AppJobView extends GetView<AppJobController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.lastPopTime == null ||
            DateTime.now().difference(controller.lastPopTime!) >
                const Duration(seconds: 2)) {
          controller
            ..lastPopTime = DateTime.now()
            ..update();
          ToastUtil.show('再按一次退出应用');
          return false;
        } else {
          controller.lastPopTime = DateTime.now();
          // 退出app
          await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          return true;
        }
      },
      child: GetBuilder<AppJobController>(
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
              BrnBottomTabBarItem(icon: Icon(Icons.send), title: Text('消息')),
              BrnBottomTabBarItem(icon: Icon(Icons.person), title: Text('我的')),
            ],
          ),
        ),
      ),
    );
  }
}
