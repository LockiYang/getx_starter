import 'package:get/get.dart';

import 'test_flutter_controller.dart';

class TestFlutterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestFlutterController>(
      () => TestFlutterController(),
    );
  }
}
