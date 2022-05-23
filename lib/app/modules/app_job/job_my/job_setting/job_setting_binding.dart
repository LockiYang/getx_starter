import 'package:get/get.dart';

import 'job_setting_controller.dart';

class JobSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobSettingController>(
      () => JobSettingController(),
    );
  }
}
