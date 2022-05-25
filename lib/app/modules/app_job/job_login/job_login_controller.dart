import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/common/utils/toast_util.dart';
import 'package:getx_test/app/modules/app_job/data/repositorys/job_api.dart';
import 'package:getx_test/app/modules/app_job/job_message/job_message_controller.dart';
import 'package:getx_test/app/modules/app_job/job_my/job_my_controller.dart';
import 'package:getx_test/app/modules/app_job/services/user_service.dart';

import '../../../routes/app_pages.dart';
import '../widgets/shake_widget.dart';

class JobLoginController extends GetxController {
  bool protocalChecked = false;
  String phoneNum = '';
  String smsCode = '';

  Timer? _smsCodeTimer;
  int countDown = 0;
  bool isSubmitEnable = false;
  bool tips = false;
  bool redirectHome = false;

  bool needUpdateInfo = false;

  final shakeKey = GlobalKey<ShakeWidgetState>();
  FocusNode phoneFocus = FocusNode();
  FocusNode smsCodeFocus = FocusNode();

  @override
  void onInit() {
    String arg = Get.arguments;
    if (arg == 'redirectHome') {
      redirectHome = true;
    }
  }

  @override
  void onClose() {
    _smsCodeTimer?.cancel();
  }

  startSmsCodeTimer() {
    countDown = 60;
    update();
    _smsCodeTimer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      countDown < 1 ? _smsCodeTimer?.cancel() : countDown--;
      update();
    });
  }

  smsCodeChange(value) {
    smsCode = value;
    ifSubmitEnable();
    update();
  }

  phoneNumChange(value) {
    phoneNum = value;
    ifSubmitEnable();
    update();
  }

  ifSubmitEnable() {
    if (phoneNum.length == 11 && smsCode.length == 4) {
      isSubmitEnable = true;
    } else {
      isSubmitEnable = false;
    }
  }

  postSmscode() {
    if (phoneNum.isEmpty || phoneNum.length != 11) {
      ToastUtil.show('请输入正确的手机号');
      return;
    }
    startSmsCodeTimer();
    // FocusScope.of(Get.context!).requestFocus(smsCodeFocus);
    JobApi.to.postSmsCode(phoneNum, success: ((data) {
      ToastUtil.show('验证码已发送');
    }));
  }

  loginFirstPage() {
    // 先完善资料
    if (needUpdateInfo) {
      Get.offAllNamed(Routes.JOB_ADDING_INFO);
    } else {
      if (redirectHome) {
        Get.offAllNamed(Routes.APP_JOB);
      } else {
        // 返回首页
        Get.until((route) => Get.currentRoute == Routes.APP_JOB);
      }
    }
  }

  login() async {
    if (phoneNum.isEmpty || phoneNum.length != 11) {
      ToastUtil.show('请输入正确的手机号');
      return;
    }
    if (smsCode.isEmpty || smsCode.length != 4) {
      ToastUtil.show('请输入短信验证码');
      return;
    }
    if (!protocalChecked) {
      shakeKey.currentState?.shake();
      tips = true;
      update();
      return;
    }
    JobApi.to.postLoginByMobile(
      phoneNum,
      smsCode,
      success: (data) {
        if (data.errcode == 0) {
          UserService.to.saveToken(data.token);
          UserService.to.saveProfile(data);
          JobApi.to.getUserInfo(
            success: (data) {
              if (data.extraInfo == null || data.extraInfo.isEmpty) {
                needUpdateInfo = true;
              }
              loginFirstPage();
            },
          );
          Get.find<JobMyController>().refreshPage();
          Get.find<JobMessageController>().refreshPage();
        } else {
          // 登录失败
        }
      },
    );
  }

  void changeChecked() {
    protocalChecked = !protocalChecked;
    if (protocalChecked) {
      tips = false;
    }
    update();
  }
}
