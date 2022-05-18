import 'package:get/get.dart';

import 'job_login_controller.dart';

class JobLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobLoginController>(
      () => JobLoginController(),
    );
  }
}
