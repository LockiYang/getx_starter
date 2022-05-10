import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'wa_setting_controller.dart';

class WaSettingView extends GetView<WaSettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('设置')),
      backgroundColor: Colors.white,
      body: Column(children: [
        ListTile(
          title: Text('账号安全', style: TextStyle(fontSize: 14),),
          trailing: const Icon(Icons.keyboard_arrow_right, size: 20,),
        ),
        ListTile(
          title: Text('关于我们', style: TextStyle(fontSize: 14),),
          trailing: const Icon(Icons.keyboard_arrow_right, size: 20,),
        ),
        ListTile(
          title: Text('清除缓存', style: TextStyle(fontSize: 14),),
          trailing: const Icon(Icons.keyboard_arrow_right, size: 20,),
        ),
      ]),
    );
  }
}
