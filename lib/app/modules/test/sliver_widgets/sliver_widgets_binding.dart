import 'package:get/get.dart';

import 'sliver_widgets_controller.dart';

class SliverWidgetsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SliverWidgetsController>(
      () => SliverWidgetsController(),
    );
  }
}
