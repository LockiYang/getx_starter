import 'package:get/get.dart';

class WelcomeController extends GetxController {
  //TODO: Implement WelcomeController

  final count = 0.obs;


  @override
  void onClose() {}
  void increment() => count.value++;
}
