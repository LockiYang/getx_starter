import 'package:get/get.dart';

import 'job_my_controller.dart';

class JobMyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobMyController>(
      () => JobMyController(),
    );
  }
}
