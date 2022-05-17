import 'package:get/get.dart';

import 'app_job_controller.dart';

class AppJobBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppJobController>(
      () => AppJobController(),
    );
  }
}
