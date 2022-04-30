import 'package:get/get.dart';

import 'list_view_controller.dart';

class ListViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListViewController>(
      () => ListViewController(),
    );
  }
}
