import 'package:get/get.dart';

import 'job_course_detail_controller.dart';

class JobCourseDetailBinding extends Bindings {
  JobCourseDetailBinding({this.tag});
  String? tag;

  @override
  void dependencies() {
    Get.lazyPut<JobCourseDetailController>(() => JobCourseDetailController(),
        tag: tag);
  }
}
