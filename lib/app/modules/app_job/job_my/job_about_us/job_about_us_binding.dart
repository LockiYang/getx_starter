import 'package:get/get.dart';

import 'job_about_us_controller.dart';

class JobAboutUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobAboutUsController>(
      () => JobAboutUsController(),
    );
  }
}
