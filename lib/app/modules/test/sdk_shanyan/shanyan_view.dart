import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'shanyan_controller.dart';

class ShanyanView extends GetView<ShanyanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShanyanView'),
        centerTitle: true,
      ),
      body: Center(
        widthFactor: 2,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              color: Colors.greenAccent,
              child: Obx(() => Text(controller.content.value)),
              width: 300,
              height: 180,
            ),
            Expanded(
              flex: 1,
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(40, 5, 40, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            controller.initSDK();
                          },
                          child: Text("闪验SDK=初始化"),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              controller.getPhoneInfo();
                            },
                            child: Text("闪验SDK=预取号")),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(40, 5, 40, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                            onPressed: () {
                              controller.setAuthThemeConfig();
                            },
                            child: Text("授权页=沉浸样式")),
                        ElevatedButton(
                            onPressed: () {
                              controller.setAuthPopupThemeConfig();
                            },
                            child: Text("授权页=弹窗样式")),
                      ],
                    ),
                  ),
                  Container(
                    child: SizedBox(
                      child: ElevatedButton(
                          onPressed: () {
                            controller.openLoginAuth();
                          },
                          child: Text("闪验SDK=拉起授权页")),
                      width: double.infinity,
                    ),
                    margin: EdgeInsets.fromLTRB(40, 5, 40, 5),
                  ),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      autofocus: false,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          hintText: "请输入手机号码",
                          hintStyle: TextStyle(color: Colors.black)),
                      controller: controller.controllerPHone,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly, //只输入数字
                        LengthLimitingTextInputFormatter(11) //限制长度
                      ],
                    ),
                    margin: EdgeInsets.fromLTRB(40, 5, 40, 5),
                  ),
                  Container(
                    child: SizedBox(
                      child: ElevatedButton(
                          onPressed: () {
                            controller.initSDK();
                          },
                          child: Text('本机认证=初始化')),
                      width: double.infinity,
                    ),
                    margin: EdgeInsets.fromLTRB(40, 5, 40, 5),
                  ),
                  Container(
                    child: SizedBox(
                      child: ElevatedButton(
                          onPressed: () {
                            // startAuthenticationState();
                            controller.startAuthentication();
                          },
                          child: Text('本机认证=获取token')),
                      width: double.infinity,
                    ),
                    margin: EdgeInsets.fromLTRB(40, 5, 40, 5),
                  )
                ],
              ),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ),
    );
  }
}
