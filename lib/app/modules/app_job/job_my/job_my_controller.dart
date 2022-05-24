import 'package:get/get.dart';
import 'package:getx_test/app/modules/app_job/services/user_service.dart';

import '../../../routes/app_pages.dart';

class JobMyController extends GetxController {
  @override
  void onClose() {}

  refreshPage() {
    UserService.to.notifyCollectNum();
    UserService.to.notifyHistoryNum();
  }

  tapLogin() {
    if (!UserService.to.isLogin.value) {
      Get.toNamed(Routes.JOB_LOGIN);
    }
  }
}
