import 'package:get/get.dart';

import 'job_course_detail_controller.dart';

class JobCourseDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobCourseDetailController>(
      () => JobCourseDetailController(),
    );
  }
}
