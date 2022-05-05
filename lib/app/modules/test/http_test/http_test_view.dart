import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'http_test_controller.dart';

class HttpTestView extends GetView<HttpTestController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpTestView'),
        centerTitle: true,
      ),
      body: Column(children: [
        ListTile(
          title: Text('GET'),
          onTap: () => controller.tab(),
        ),
      ]),
    );
  }
}
