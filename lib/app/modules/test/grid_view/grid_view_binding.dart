import 'package:get/get.dart';

import 'grid_view_controller.dart';

class GridViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GridViewController>(
      () => GridViewController(),
    );
  }
}
