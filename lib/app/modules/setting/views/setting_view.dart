import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/components/page_bar.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        PageBarWidget(title: '设置',),
        ListTile(
          title: Text('账号安全', style: TextStyle(fontSize: 14),),
          trailing: const Icon(Icons.keyboard_arrow_right, size: 20,),
        ),
        ListTile(
          title: Text('关于我们', style: TextStyle(fontSize: 14),),
          trailing: const Icon(Icons.keyboard_arrow_right, size: 20,),
        ),
        ListTile(
          title: Text('注销登录', style: TextStyle(fontSize: 14),),
          trailing: const Icon(Icons.keyboard_arrow_right, size: 20,),
        ),
      ]),
    );
  }
}
