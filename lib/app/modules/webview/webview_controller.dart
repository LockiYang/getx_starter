import 'package:get/get.dart';

class WebviewController extends GetxController {
  
  WebModel model = Get.arguments;
  var progress = 0.0.obs;

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
}

class WebModel {
  String title;
  String url;
  WebModel({required this.title, required this.url});
}
