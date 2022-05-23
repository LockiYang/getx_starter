import 'package:get/get.dart';

import 'job_collect_controller.dart';

class JobCollectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobCollectController>(
      () => JobCollectController(),
    );
  }
}
