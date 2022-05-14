import 'package:get/get.dart';
import 'package:getx_test/app/routes/app_pages.dart';

class TestNewsController extends GetxController {

  // 跳转 注册界面
  handleNavSignIn() async {
    // await ConfigStore.to.saveAlreadyOpen();
    Get.offAndToNamed(Routes.NEWS_SIGNIN);
  }

  final count = 0.obs;


  @override
  void onClose() {}
  void increment() => count.value++;
}
