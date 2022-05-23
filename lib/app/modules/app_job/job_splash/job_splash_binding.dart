import 'package:get/get.dart';

import 'job_splash_controller.dart';

class JobSplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<JobSplashController>(
      JobSplashController(),
    );
  }
}
