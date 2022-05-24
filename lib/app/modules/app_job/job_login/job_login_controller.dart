import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/common/utils/toast_util.dart';
import 'package:getx_test/app/modules/app_job/data/repositorys/job_api.dart';
import 'package:getx_test/app/modules/app_job/services/user_service.dart';

import '../../../routes/app_pages.dart';
import '../widgets/shake_widget.dart';

class JobLoginController extends GetxController {
  final shakeKey = GlobalKey<ShakeWidgetState>();
  
  bool protocalChecked = false;
  String phoneNum = '';
  String smsCode = '';

  Timer? _smsCodeTimer;
  int countDown = 0;
  bool isSubmitEnable = false;

  FocusNode phoneFocus = FocusNode();
  FocusNode smsCodeFocus = FocusNode();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
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
    // shakeKey.currentState?.shake();
    // return;
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

  login() {
    if (phoneNum.isEmpty || phoneNum.length != 11) {
      ToastUtil.show('请输入正确的手机号');
      return;
    }
    if (smsCode.isEmpty || smsCode.length != 4) {
      ToastUtil.show('请输入短信验证码');
      return;
    }
    if (protocalChecked) {
      ToastUtil.show('请勾选同意后再登录');
      return;
    }
    JobApi.to.postLoginByMobile(
      phoneNum,
      smsCode,
      success: (data) {
        if (data.errcode == 0) {
          UserService.to.saveToken(data.token);
          UserService.to.saveProfile(data);
          Get.until((route) => Get.currentRoute == Routes.APP_JOB);
        } else {
          // 登录失败
        }
      },
    );
  }

  changeChecked(value) {
    value ? protocalChecked = true : protocalChecked = false;
    update();
  }
}
