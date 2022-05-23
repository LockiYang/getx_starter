import 'package:get/get.dart';

import 'shanyan_controller.dart';

class ShanyanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShanyanController>(
      () => ShanyanController(),
    );
  }
}
