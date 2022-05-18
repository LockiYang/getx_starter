import 'package:get/get.dart';

import 'job_message_controller.dart';

class JobMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobMessageController>(
      () => JobMessageController(),
    );
  }
}
