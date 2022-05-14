import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'test_flutter_controller.dart';

class TestFlutterView extends GetView<TestFlutterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestFlutterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TestFlutterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
