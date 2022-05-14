import 'package:get/get.dart';

class TestFlutterController extends GetxController {
  //TODO: Implement TestFlutterController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
