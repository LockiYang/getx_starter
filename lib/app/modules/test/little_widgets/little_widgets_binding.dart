import 'package:get/get.dart';

import 'little_widgets_controller.dart';

class LittleWidgetsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LittleWidgetsController>(
      () => LittleWidgetsController(),
    );
  }
}
