import 'package:flutter/material.dart';

import 'package:getx_test/app/common/getx/getz_view.dart';
import 'package:getx_test/app/common/styles/zstyle.dart';
import 'package:getx_test/app/common/widgets/button/basic_button.dart';

import 'sdk_wechat_controller.dart';

class SdkWechatView extends GetzView<SdkWechatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SdkWechatView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text('结果：' + controller.result!),
            BasicButtom(
              text: '微信SDK - 拉起小程序',
              onTap: controller.tapLaunchWeChatMiniProgram,
            ),
            Spacez.vSpacezMd,
            BasicButtom(
              text: '微信SDK - 打开微信',
              onTap: controller.tapOpenWechat,
            ),
          ]),
        ),
      ),
    );
  }
}
