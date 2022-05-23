import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/common/getx/getz_view.dart';
import 'package:getx_test/app/common/styles/zstyle_constants.dart';
import 'package:getx_test/app/common/widgets/button/basic_button.dart';
import 'package:getx_test/app/common/widgets/button/basic_switch_button.dart';
import 'package:getx_test/app/modules/app_job/job_my/job_setting/widgets/delete_account.dart';
import 'package:getx_test/app/modules/app_job/services/config_service.dart';

import '../../../../common/widgets/menu_list_tile.dart';
import 'job_setting_controller.dart';

class JobSettingView extends GetzView<JobSettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('设置')),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          MenuListTile(
            title: '账号与安全',
            onTap: () => Get.to(() => DeleteAccountWidget()),
          ),
          MenuListTile(
            title: '个性化推荐',
            endWidget: Obx(() => BasicSwitchButton(
                value: ConfigService.to.isAppRecommend,
                onChanged: controller.changeRecommend,
                size: Size(40, 20))),
          ),
          MenuListTile(
            title: '清除缓存',
            content: controller.cacheSize,
            onTap: () => {controller.clearCache()},
          ),
          SizedBox(
            height: 50,
          ),
          BasicButtom.outline(
            onTap: () => controller.logout(),
            text: '退出登录',
            textStyle: TextStyle(color: ZStyleConstans.colorTextSecondary),
            constraints: BoxConstraints.expand(width: 100, height: 40),
          )
        ]),
      ),
    );
  }
}
