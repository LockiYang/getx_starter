import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/components/menu_item.dart';
import 'package:getx_test/app/routes/app_pages.dart';
import 'package:getx_test/app/styles/app_theme.dart';
import 'package:getx_test/app/utils/screen_util.dart';

import 'my_controller.dart';

class MyView extends GetView<MyController> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.removeStatusBarTransparent(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Column(children: [
            // 个人信息
            Row(
              children: [
                // 头像
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 50,
                    height: 50,
                    child: Image.asset('assets/images/customer.jpg'),
                  ),
                ),
                // 昵称
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text('我是张三'),
                ),
                const Expanded(child: Text('')),
                // 设置
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.SETTING),
                  child: Icon(
                    Icons.settings,
                    color: appColorMedium,
                  ),
                )
              ],
            ),
          
            // 数据预览
            GestureDetector(
              onTap: () => Get.toNamed(Routes.ENROLL),
              child: Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(4, 4),
                          color: appColorlight,
                          blurRadius: 10)
                    ]),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Text('0'),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '全部',
                          style: TextStyle(color: appColorMedium),
                        )
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        Text('0'),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '已报名',
                          style: TextStyle(color: appColorMedium),
                        )
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        Text('0'),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '已录取',
                          style: TextStyle(color: appColorMedium),
                        )
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        Text('0'),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '已结束',
                          style: TextStyle(color: appColorMedium),
                        )
                      ],
                    ))
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                ),
              ),
            ),
          
            // 菜单
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(2, 1),
                        color: appColorlight,
                        blurRadius: 10)
                  ]),
              child: Column(children: [
                MenuItemWidget(
                  icon: Icons.perm_identity,
                  title: '我的简历',
                  endIconColor: appColorMedium,
                ),
                MenuItemWidget(
                  icon: Icons.perm_identity,
                  title: '我的收藏',
                  endIconColor: appColorMedium,
                ),
                MenuItemWidget(
                  icon: Icons.perm_identity,
                  title: '意见反馈',
                  endIconColor: appColorMedium,
                ),
                MenuItemWidget(
                  icon: Icons.perm_identity,
                  title: '帮助中心',
                  endIconColor: appColorMedium,
                ),
                MenuItemWidget(
                  icon: Icons.perm_identity,
                  title: '用户协议',
                  endIconColor: appColorMedium,
                )
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
