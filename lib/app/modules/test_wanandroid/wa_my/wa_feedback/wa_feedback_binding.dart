import 'package:get/get.dart';

import 'wa_feedback_controller.dart';

class WaFeedbackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaFeedbackController>(
      () => WaFeedbackController(),
    );
  }
}
