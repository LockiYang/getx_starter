import 'package:flutter/material.dart';

import '../../../../common/getx/getz_view.dart';
import 'wa_setting_controller.dart';

class WaSettingView extends GetzView<WaSettingController> {
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
          trailing: Text(controller.cacheSize),
          onTap: () => {controller.clearCache()},
        ),
        SizedBox(height: 20,),
        OutlinedButton(onPressed: () => {}, child: Text('退出登录'))
      ]),
    );
  }
}
