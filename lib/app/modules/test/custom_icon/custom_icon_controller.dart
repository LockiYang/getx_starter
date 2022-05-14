import 'package:get/get.dart';

class CustomIconController extends GetxController {
  //TODO: Implement CustomIconController

  final count = 0.obs;


  @override
  void onClose() {}
  void increment() => count.value++;
}
