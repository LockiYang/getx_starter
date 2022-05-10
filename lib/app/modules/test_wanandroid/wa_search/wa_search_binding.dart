import 'package:get/get.dart';

import 'wa_search_controller.dart';

class WaSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaSearchController>(
      () => WaSearchController(),
    );
  }
}
