import 'package:get/get.dart';

class MyController extends GetxController {
  //TODO: Implement MyController

  final count = 0.obs;


  @override
  void onClose() {}
  void increment() => count.value++;
}
