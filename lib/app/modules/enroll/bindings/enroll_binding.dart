import 'package:get/get.dart';

import '../controllers/enroll_controller.dart';

class EnrollBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnrollController>(
      () => EnrollController(),
    );
  }
}
