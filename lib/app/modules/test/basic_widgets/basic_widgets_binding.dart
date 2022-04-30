import 'package:get/get.dart';

import 'basic_widgets_controller.dart';

class BasicWidgetsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BasicWidgetsController>(
      () => BasicWidgetsController(),
    );
  }
}
