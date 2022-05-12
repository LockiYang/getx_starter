import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/common/getx/getz_view.dart';

import 'wa_login_controller.dart';

class WaLoginView extends GetzView<WaLoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BrnAppBar(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/logo1.png',
                  width: 40,
                  height: 40,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '立即登录，解锁高薪兼职',
                style: Get.textTheme.headline5,
              )
            ],
          ),
          Text(
            '未注册过的手机号将自动创建账号',
            style: Get.textTheme.caption,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    '+86',
                    style: TextStyle(fontSize: 16, height: 1),
                  )),
              SizedBox(
                width: 1,
                height: 12,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Get.theme.dividerColor),
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      hintText: '请输入手机号',
                      hintStyle: TextStyle(fontSize: 18, height: 1),
                      border: InputBorder.none),
                  style: TextStyle(fontSize: 18, height: 1),
                ),
              ),
            ],
          ),
          Divider(
            height: 1,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: '请输入验证码',
                      hintStyle: TextStyle(fontSize: 18, height: 1),
                      border: InputBorder.none),
                  style: TextStyle(fontSize: 18, height: 1),
                ),
              ),
              SizedBox(
                width: 1,
                height: 12,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Get.theme.dividerColor),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '获取验证码',
                  style: TextStyle(fontSize: 16, height: 1),
                  // strutStyle: StrutStyle(forceStrutHeight: true, leading: 0.2),
                ),
              )
            ],
          ),
          Divider(
            height: 1,
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BrnCheckbox(
                radioIndex: 1,
                isSelected: controller.checked,
                onValueChangedAtIndex: (index, status) =>
                    controller.changeChecked(status),
                child: Text(
                  '已阅读并同意用户协议和隐私协议',
                  style: TextStyle(fontSize: 14),
                  // strutStyle: StrutStyle(forceStrutHeight: true, leading: 0.2),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          BrnBigMainButton(title: '立即登录',)
        ]),
      ),
    );
  }
}
