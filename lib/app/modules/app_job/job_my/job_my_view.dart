import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/common/getx/getz_view_binding.dart';
import 'package:getx_test/app/common/styles/zstyle.dart';
import 'package:getx_test/app/common/styles/zstyle_constants.dart';
import 'package:getx_test/app/modules/app_job/job_my/job_my_binding.dart';
import 'package:getx_test/app/modules/app_job/services/user_service.dart';

import '../../../common/widgets/menu_list_tile.dart';
import '../../../routes/app_pages.dart';
import '../../webview/webview_controller.dart';
import '../services/config_service.dart';
import 'job_my_controller.dart';

class JobMyView extends GetzViewBindng<JobMyController> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 30 + statusBarHeight, 20, 20),
        child: Column(children: [
          // 个人信息
          Row(
            children: [
              // 头像
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: 50,
                  height: 50,
                  child: Image.asset('assets/images/customer.jpg'),
                ),
              ),
              // 昵称
              GestureDetector(
                onTap: controller.tapLogin,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Obx(() => UserService.to.isLogin.value
                      ? Text(
                          UserService.to.username.value,
                          style: ZStyle.textHead,
                        )
                      : Text('点击登录', style: ZStyle.textHead)),
                ),
              ),
              const Expanded(child: Text('')),
              // 设置
              GestureDetector(
                onTap: () => Get.toNamed(Routes.JOB_SETTING),
                child: Icon(
                  Icons.settings,
                  color: ZStyleConstans.colorTextSecondary,
                ),
              )
            ],
          ),

          // 数据预览
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(4, 4),
                      color: ZStyleConstans.borderColorBase,
                      blurRadius: 10)
                ]),
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () => Get.toNamed(Routes.JOB_COLLECT),
                  child: Column(
                    children: [
                      Obx(() => Text(UserService.to.collectNum.value.toString(),
                          style: ZStyle.textHead)),
                      Spacez.vSpacezXs,
                      Text(
                        '收藏',
                        style:
                            TextStyle(color: ZStyleConstans.colorTextSecondary),
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () => Get.toNamed(Routes.JOB_HISTORY),
                  child: Column(
                    children: [
                      Obx((() => Text(
                            UserService.to.historyNum.value.toString(),
                            style: ZStyle.textHead,
                          ))),
                      Spacez.vSpacezXs,
                      Text(
                        '历史',
                        style:
                            TextStyle(color: ZStyleConstans.colorTextSecondary),
                      )
                    ],
                  ),
                ))
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
          ),

          // 菜单
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(2, 1),
                      color: ZStyleConstans.borderColorBase,
                      blurRadius: 10)
                ]),
            child: Column(children: [
              MenuListTile(
                iconImg: Image.asset('assets/icons/wy_feedback.png', height: 22,),
                title: '意见反馈',
                onTap: () => Get.toNamed(Routes.JOB_FEEDBACK),
              ),
              MenuListTile(
                iconImg: Image.asset('assets/icons/wy_help.png', height: 22,),
                title: '帮助中心',
                onTap: () => Get.toNamed(Routes.WEBVIEW,
                    arguments: WebModel(
                      title: '帮助中心',
                      link: ConfigService.askCenterUrl,
                    )),
              ),
              MenuListTile(
                iconImg: Image.asset('assets/icons/wy_protocal.png', height: 22,),
                title: '用户协议',
                onTap: () => Get.toNamed(Routes.WEBVIEW,
                    arguments: WebModel(
                      title: '用户协议',
                      link: ConfigService.agreementUrl,
                    )),
              ),
              MenuListTile(
                iconImg: Image.asset('assets/icons/wy_us.png', height: 22,),
                title: '关于我们',
                onTap: () => Get.toNamed(Routes.JOB_ABOUT_US),
              )
            ]),
          )
        ]),
      ),
    );
  }

  @override
  Bindings? binding() {
    return JobMyBinding();
  }
}
