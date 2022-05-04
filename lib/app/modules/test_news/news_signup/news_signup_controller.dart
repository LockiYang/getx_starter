import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsSignupController extends GetxController {
  
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

    // 返回上一页
  handleNavPop() {
    Get.back();
  }

    // 提示信息
  handleTip() {
    // toastInfo(msg: '这是注册界面');
  }

    // 忘记密码
  handleFogotPassword() {
    // toastInfo(msg: '忘记密码');
  }

  // 执行注册操作
  handleSignUp() async {
    // if (!duCheckStringLength(fullnameController.value.text, 5)) {
    //   toastInfo(msg: '用户名不能小于5位');
    //   return;
    // }
    // if (!duIsEmail(emailController.value.text)) {
    //   toastInfo(msg: '请正确输入邮件');
    //   return;
    // }
    // if (!duCheckStringLength(passController.value.text, 6)) {
    //   toastInfo(msg: '密码不能小于6位');
    //   return;
    // }

    // UserRegisterRequestEntity params = UserRegisterRequestEntity(
    //   email: emailController.value.text,
    //   password: duSHA256(passController.value.text),
    // );

    // await UserAPI.register(
    //   params: params,
    // );

    Get.back();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  @override
  void dispose() {
    fullnameController.dispose();
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
}
