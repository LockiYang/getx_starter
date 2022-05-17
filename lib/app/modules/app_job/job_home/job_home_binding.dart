import 'package:get/get.dart';

import 'job_home_controller.dart';

class JobHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobHomeController>(
      () => JobHomeController(),
    );
  }
}
