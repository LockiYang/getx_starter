import 'package:get/get.dart';

class WebviewController extends GetxController {
  WebModel model = Get.arguments;
  var progress = 0.0;

  @override
  void onClose() {}
}

class WebModel {
  String title;
  String link;
  int id;
  bool isCollect;

  WebModel(
      {this.title = '', this.link = '', this.id = 0, this.isCollect = true});
}
