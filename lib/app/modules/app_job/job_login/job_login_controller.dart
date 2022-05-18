import 'package:get/get.dart';

class JobLoginController extends GetxController {

  bool protocalChecked = true;
  String username = '';
  String password = '';

  changeChecked(value) {
    // debugPrint(value.toString());
    protocalChecked = value;
    update();
  }

  login() {
    if (username.isEmpty || password.isEmpty) {
      return;
    }

    // wanAndroidApi.login(username, password, success: (data) {
    //   var loginUser = User.fromJson(data);
    //   loginUser.password = password;
    //   CacheUtil.putUserInfo(loginUser);
    //   // Get.offAllNamed(Routes.TEST_WANANDROID);
    //   Get.until((route) => Get.currentRoute == Routes.TEST_WANANDROID);
    // }, fail: (error){
    //   ToastUtil.show(error.message);
    // });
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
}
