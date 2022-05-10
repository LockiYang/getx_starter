import 'package:get/get.dart';

import 'wa_my_controller.dart';

class WaMyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaMyController>(
      () => WaMyController(),
    );
  }
}
