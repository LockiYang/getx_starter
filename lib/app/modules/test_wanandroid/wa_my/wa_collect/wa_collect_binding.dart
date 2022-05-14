import 'package:get/get.dart';

import 'wa_collect_controller.dart';

class WaCollectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaCollectController>(
      () => WaCollectController(),
    );
  }
}
