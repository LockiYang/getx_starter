import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'sdk_wechat_controller.dart';

class SdkWechatView extends GetView<SdkWechatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SdkWechatView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SdkWechatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
