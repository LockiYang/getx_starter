import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/styles/zstyle.dart';
import '../../../common/styles/zstyle_constants.dart';
import '../../../routes/app_pages.dart';
import '../../webview/webview_controller.dart';
import '../services/config_service.dart';

class ProtocalContent extends StatelessWidget {
  const ProtocalContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(children: [
        Text(
            '感谢您信任并使用${ConfigService.appName}，依据最新法律要求，我们更新了用户协议、隐私协议并根据您使用的服务的具体功能对您的个人信息进行收集、使用和共享。'),
        Spacez.vSpacezSm,
        RichText(
          text: TextSpan(
              style: TextStyle(
                  color: ZStyleConstans.colorTextSecondary, fontSize: 14),
              children: [
                TextSpan(text: '请您仔细阅读'),
                TextSpan(
                  text: '《用户协议》',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.toNamed(Routes.WEBVIEW,
                          arguments: WebModel(
                            title: '用户协议',
                            link: ConfigService.agreementUrl,
                          ));
                    },
                ),
                TextSpan(text: '和'),
                TextSpan(
                  text: '《隐私政策》',
                  style: TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.toNamed(Routes.WEBVIEW,
                          arguments: WebModel(
                            title: '隐私政策',
                            link: ConfigService.policyUrl,
                          ));
                    },
                ),
                TextSpan(text: '，并确认了解我们对您个人信息的处理规则。'),
              ]),
        )
      ]),
    );
  }
}
