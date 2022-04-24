import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/components/common_dialog.dart';
import 'package:getx_test/app/components/loadding_dialog.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/screen_util.dart';
import '../../navbar/navbar.dart';
import '../controllers/test_controller.dart';

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
            ElevatedButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  animationDuration: const Duration(milliseconds: 200),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                  shape: MaterialStateProperty.all(const StadiumBorder()),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  // foregroundColor: MaterialStateProperty.all(Colors.green)
                ),
                onPressed: () => Get.toNamed(Routes.WELCOME),
                child: Text('登录')),
            ElevatedButton(
              onPressed: () => Get.to(Navbar()),
              child: Text('Navbar'),
            ),
            OutlinedButton(
                onPressed: () {
                  Get.dialog(CommonDialog(
                    title: '退出登录',
                    content: '确定要退出登录',
                    backText: '取消',
                    nextText: '确定',
                  ));
                },
                child: Text('Common Dialog')),
            OutlinedButton(
                onPressed: () {
                  Get.dialog(LoadingDialog());
                },
                child: Text('Loadding Dialog')),
                Text('测试测试', style: Get.textTheme.caption),
          ],
        ),
      ),
    ));
  }
}
