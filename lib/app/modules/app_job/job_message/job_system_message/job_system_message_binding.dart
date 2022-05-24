import 'package:get/get.dart';

import 'job_system_message_controller.dart';

class JobSystemMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobSystemMessageController>(
      () => JobSystemMessageController(),
    );
  }
}
