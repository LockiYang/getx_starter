import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/routes/app_pages.dart';

class NewsSigninController extends GetxController {
  
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  // 跳转 注册界面
  handleNavSignUp() {
    Get.toNamed(Routes.NEWS_SIGNUP);
  }

  // 忘记密码
  handleFogotPassword() {
    // toastInfo(msg: '忘记密码');
  }

  // 执行登录操作
  handleSignIn() async {
    // if (!duIsEmail(_emailController.value.text)) {
    //   toastInfo(msg: '请正确输入邮件');
    //   return;
    // }
    // if (!duCheckStringLength(_passController.value.text, 6)) {
    //   toastInfo(msg: '密码不能小于6位');
    //   return;
    // }

    // UserLoginRequestEntity params = UserLoginRequestEntity(
    //   email: emailController.value.text,
    //   password: duSHA256(passController.value.text),
    // );

    // UserLoginResponseEntity userProfile = await UserAPI.login(
    //   params: params,
    // );
    // UserStore.to.saveProfile(userProfile);

    Get.offAndToNamed(Routes.NEWS_INDEX);
  }



  @override
  void onClose() {}
}
