import 'package:get/get.dart';

import 'wa_video_controller.dart';

class WaVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaVideoController>(
      () => WaVideoController(),
    );
  }
}
