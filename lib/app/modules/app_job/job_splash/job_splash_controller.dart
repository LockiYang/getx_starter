import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/common/utils/dialog_util.dart';
import 'package:getx_test/app/modules/app_job/services/user_service.dart';

import '../../../routes/app_pages.dart';
import '../services/config_service.dart';
import '../widgets/protocal_widget.dart';

class JobSplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(milliseconds: 1000), () {
      if (!ConfigService.to.isProtocalAgree) {
        DialogUtil.commonDialog(
            tipWidget: Container(
              margin: EdgeInsets.only(bottom: 10),
              child: SvgPicture.asset(
                'assets/svgs/wy_protocal.svg',
                width: 80,
                // color: Colors.red,
              ),
            ),
            title: '用户协议及隐私政策',
            contentWidget: ProtocalContent(),
            backText: '不同意',
            nextText: '同意',
            nextTap: protocalAgree,
            backTap: () => Get.offAllNamed(Routes.JOB_BROWSER_MODE),
            isNotice: true);
      } else {
        toFirstPage();
      }
    });
  }

  static protocalAgree() {
    ConfigService.to.setIsProtocalAgree(true);
    toFirstPage();
  }

  static toFirstPage() {
    Get.offAllNamed(Routes.APP_JOB);
    // if (Platform.isIOS) {
    //   // IOS直接登录
    //   Get.offAllNamed(Routes.JOB_LOGIN, arguments: 'redirectHome');
    // } else if (!UserService.to.isLogin.value &&
    //     ConfigService.to.androidMustLogin) {
    //   Get.offAllNamed(Routes.JOB_LOGIN, arguments: 'redirectHome');
    // } else {
    //   Get.offAllNamed(Routes.APP_JOB);
    // }
  }

  /// 退出登录
  static toLastPage() {
    Get.until((route) => Get.currentRoute == Routes.APP_JOB);
    // if (Platform.isIOS) {
    //   // IOS直接登录
    //   Get.offAllNamed(Routes.JOB_LOGIN, arguments: 'redirectHome');
    // } else if (!UserService.to.isLogin.value &&
    //     ConfigService.to.androidMustLogin) {
    //   Get.offAllNamed(Routes.JOB_LOGIN, arguments: 'redirectHome');
    // } else {
    //   Get.until((route) => Get.currentRoute == Routes.APP_JOB);
    // }
  }

  @override
  void onClose() {}
}
