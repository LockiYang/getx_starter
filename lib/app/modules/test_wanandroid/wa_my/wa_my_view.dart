import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/common/getx/getz_view_binding.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_my/wa_my_binding.dart';
import '../../../common/getx/get_extension.dart';

import '../../../common/widgets/menu_item.dart';
import '../../../routes/app_pages.dart';
import '../../../styles/app_theme.dart';
import '../../../utils/screen_util.dart';
import 'wa_my_controller.dart';

class WaMyView extends GetzViewBindng<WaMyController> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.removeStatusBarTransparent(context);
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
              Container(
                margin: EdgeInsets.only(left: 10),
                child: controller.loginUser != null
                    ? Text(
                        controller.loginUser!.nickname,
                        style: TextStyle(fontSize: 16),
                      )
                    : GestureDetector(
                        child: Text('点击登录', style: TextStyle(fontSize: 16)),
                        onTap: () => Get.toNamed(Routes.WA_LOGIN),
                      ),
              ),
              const Expanded(child: Text('')),
              // 设置
              GestureDetector(
                onTap: () => Get.toNamed(Routes.WA_SETTING),
                child: Icon(
                  Icons.settings,
                  color: appColorMedium,
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
                      color: appColorlight,
                      blurRadius: 10)
                ]),
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () => Get.toNamed(Routes.WA_COLLECT),
                  child: Column(
                    children: [
                      Text('0'),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '收藏',
                        style: TextStyle(color: appColorMedium),
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: Column(
                  children: [
                    Text('0'),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '分享',
                      style: TextStyle(color: appColorMedium),
                    )
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Text('0'),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '积分',
                      style: TextStyle(color: appColorMedium),
                    )
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Text('0'),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '历史',
                      style: TextStyle(color: appColorMedium),
                    )
                  ],
                ))
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
          ),

          // 菜单
          Container(
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(2, 1),
                      color: appColorlight,
                      blurRadius: 10)
                ]),
            child: Column(children: [
              ///积分排行榜
              GestureDetector(
                onTap: () => Get.toNamed(Routes.WA_LOGIN),
                child: Container(
                  padding: const EdgeInsets.only(top: 16, left: 16, bottom: 10),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.volume_down,
                        size: 20,
                        color: Color(0xFF24CF5F),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '快来查看积分排行榜吧~',
                        style:
                            TextStyle(color: Color(0xFF24CF5F), fontSize: 13),
                      )
                    ],
                  ),
                ),
              ),
              MenuItemWidget(
                icon: Icons.perm_identity,
                title: '个人信息',
                endIconColor: appColorMedium,
                onTap: () => Get.showLoading(text: '加载中'),
              ),
              MenuItemWidget(
                icon: Icons.perm_identity,
                title: '关于',
                endIconColor: appColorMedium,
              ),
              MenuItemWidget(
                icon: Icons.perm_identity,
                title: '分享',
                endIconColor: appColorMedium,
              ),
              MenuItemWidget(
                icon: Icons.perm_identity,
                title: '问题反馈',
                endIconColor: appColorMedium,
                onTap: () => Get.toNamed(Routes.WA_FEEDBACK),
              )
            ]),
          )
        ]),
      ),
    );
  }

  @override
  Bindings? binding() {
    return WaMyBinding();
  }
}
