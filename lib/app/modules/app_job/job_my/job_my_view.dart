import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/common/getx/getz_view_binding.dart';
import 'package:getx_test/app/common/styles/zstyle.dart';
import 'package:getx_test/app/common/styles/zstyle_constants.dart';
import 'package:getx_test/app/modules/app_job/job_my/job_my_binding.dart';
import 'package:getx_test/app/modules/app_job/services/user_service.dart';

import '../../../common/widgets/menu_list_tile.dart';
import '../../../routes/app_pages.dart';
import 'job_my_controller.dart';

class JobMyView extends GetzViewBindng<JobMyController> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // width: double.infinity,
        padding: EdgeInsets.fromLTRB(20, 20 + statusBarHeight, 20, 20),
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
                  child: Obx(() => UserService.to.isLogin
                      ? Text(
                          UserService.to.profile.username
                              .replaceFirst(RegExp(r'\d{4}'), '****', 3),
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
                      Text(controller.collectNum.toString(),
                          style: ZStyle.textHead),
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
                      Text(
                        UserService.to.getBrowseHistoryLength().toString(),
                        style: ZStyle.textHead,
                      ),
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
                icon: Icons.outlet,
                title: '意见反馈',
                onTap: () => Get.toNamed(Routes.JOB_FEEDBACK),
              ),
              MenuListTile(
                icon: Icons.help_outline,
                title: '帮助中心',
              ),
              MenuListTile(
                icon: Icons.help_outline,
                title: '用户协议',
                onTap: () => {Get.toNamed(Routes.JOB_SPLASH)},
              ),
              MenuListTile(
                icon: Icons.info_outline,
                title: '关于我们',
                onTap: () => Get.toNamed(Routes.JOB_ADDING_INFO),
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
