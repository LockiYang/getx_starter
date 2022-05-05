import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/utils/toast_util.dart';

import 'little_widgets_controller.dart';

class LittleWidgetsView extends GetView<LittleWidgetsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LittleWidgetsView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(title: Text('Toast'), onTap: () => ToastUtil.show('这是测试')),
        ],
      ),
    );
  }
}
