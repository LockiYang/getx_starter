import 'package:get/get.dart';

import 'job_feedback_controller.dart';

class JobFeedbackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobFeedbackController>(
      () => JobFeedbackController(),
    );
  }
}
