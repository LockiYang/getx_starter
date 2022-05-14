import 'package:get/get.dart';

class LittleWidgetsController extends GetxController {
  //TODO: Implement LittleWidgetsController

  final count = 0.obs;


  @override
  void onClose() {}
  void increment() => count.value++;
}
