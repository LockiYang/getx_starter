import 'package:get/get.dart';

class TestController extends GetxController {
  //TODO: Implement TestController

  final count = 0.obs;


  @override
  void onClose() {}
  void increment() => count.value++;
}
