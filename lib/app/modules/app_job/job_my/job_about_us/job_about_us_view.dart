import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../common/styles/zstyle.dart';
import '../../../../common/widgets/menu_list_tile.dart';
import '../../../../routes/app_pages.dart';
import '../../../webview/webview_controller.dart';
import '../../services/config_service.dart';
import 'job_about_us_controller.dart';

class JobAboutUsView extends GetView<JobAboutUsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('关于我们'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/icons/icon.png',
                      width: 60,
                    )),
                Spacez.vSpacezMd,
                Text(
                  ConfigService.appName!,
                  style: ZStyle.textSubHead,
                ),
                Spacez.vSpacezXxl,
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      MenuListTile(
                        title: '版本信息',
                        content: ConfigService.appVersion,
                      ),
                      MenuListTile(
                        title: '用户协议',
                        onTap: () => Get.toNamed(Routes.WEBVIEW,
                            arguments: WebModel(
                              title: '用户协议',
                              link: ConfigService.agreementUrl,
                            )),
                      ),
                      MenuListTile(
                        title: '隐私政策',
                        onTap: () => Get.toNamed(Routes.WEBVIEW,
                            arguments: WebModel(
                              title: '隐私政策',
                              link: ConfigService.policyUrl,
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
