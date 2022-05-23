import 'package:get/get.dart';

import 'job_adding_info_controller.dart';

class JobAddingInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobAddingInfoController>(
      () => JobAddingInfoController(),
    );
  }
}
