import 'package:get/get.dart';

import 'wa_login_controller.dart';

class WaLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaLoginController>(
      () => WaLoginController(),
    );
  }
}
