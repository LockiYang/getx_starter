import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'wa_home_controller.dart';

class WaHomeView extends GetView<WaHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WaHomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'WaHomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
