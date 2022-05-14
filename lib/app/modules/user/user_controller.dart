import 'package:get/get.dart';

class UserController extends GetxController {
  //TODO: Implement UserController

  final count = 0.obs;


  @override
  void onClose() {}
  void increment() => count.value++;
}
