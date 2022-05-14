import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'wa_collect_controller.dart';

class WaCollectView extends GetView<WaCollectController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BrnAppBar(
        title: '我的收藏',
      ),
      body: Center(
        child: Text(
          'WaCollectView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
