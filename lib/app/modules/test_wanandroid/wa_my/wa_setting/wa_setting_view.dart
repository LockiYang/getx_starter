import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

import '../../../../common/getx/getz_view.dart';
import 'wa_setting_controller.dart';

class WaSettingView extends GetzView<WaSettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('设置')),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          BrnActionCardTitle(
            title: '账号安全',
          ),
          BrnActionCardTitle(
            title: '关于我们',
          ),
          BrnActionCardTitle(
            title: '清除缓存',
            accessoryText: controller.cacheSize,
            onTap: () => {controller.clearCache()},
          ),
          SizedBox(
            height: 50,
          ),
          BrnSmallOutlineButton(onTap: () => controller.logout(), title: '退出登录')
        ]),
      ),
    );
  }
}
