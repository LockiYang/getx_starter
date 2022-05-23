import 'package:get/get.dart';
import 'package:getx_test/app/routes/app_pages.dart';

import 'service/news_config_service.dart';

class TestNewsController extends GetxController {
  // 跳转 注册界面
  handleNavSignIn() async {
    await NewsConfigService.to.saveAlreadyOpen();
    Get.offAndToNamed(Routes.NEWS_SIGNIN);
  }

  @override
  void onClose() {}
}
