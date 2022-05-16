import 'package:get/get.dart';

import 'wa_video_detail_controller.dart';

class WaVideoDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaVideoDetailController>(
      () => WaVideoDetailController(),
    );
  }
}
