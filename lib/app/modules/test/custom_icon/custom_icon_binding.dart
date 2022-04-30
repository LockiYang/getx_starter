import 'package:get/get.dart';

import 'custom_icon_controller.dart';

class CustomIconBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomIconController>(
      () => CustomIconController(),
    );
  }
}
