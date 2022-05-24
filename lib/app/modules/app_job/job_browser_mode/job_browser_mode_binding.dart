import 'package:get/get.dart';

import 'job_browser_mode_controller.dart';

class JobBrowserModeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobBrowserModeController>(
      () => JobBrowserModeController(),
    );
  }
}
