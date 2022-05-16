import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'sdk_umeng_controller.dart';

class SdkUmengView extends GetView<SdkUmengController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SdkUmengView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SdkUmengView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
