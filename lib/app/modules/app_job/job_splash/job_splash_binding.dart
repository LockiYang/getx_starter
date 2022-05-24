import 'package:get/get.dart';

import '../job_message/job_message_controller.dart';
import '../job_my/job_my_controller.dart';
import 'job_splash_controller.dart';

class JobSplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<JobSplashController>(
      JobSplashController(),
    );
    // 预先创建，保存状态
    Get.put<JobMessageController>(JobMessageController(), permanent: true);
    Get.put<JobMyController>(JobMyController(), permanent: true);
  }
}
