import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'test_eyepetizer_controller.dart';

class TestEyepetizerView extends GetView<TestEyepetizerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestEyepetizerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TestEyepetizerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
