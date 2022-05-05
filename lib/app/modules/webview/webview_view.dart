import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'webview_controller.dart';

class WebviewView extends GetView<WebviewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebviewView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'WebviewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
