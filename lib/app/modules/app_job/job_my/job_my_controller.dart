import 'package:get/get.dart';
import 'package:getx_test/app/modules/app_job/data/repositorys/job_api.dart';
import 'package:getx_test/app/modules/app_job/services/user_service.dart';

import '../../../routes/app_pages.dart';

class JobMyController extends GetxController {
  int collectNum = 0;
  int historyNum = 0;
  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  @override
  void onClose() {}

  tapLogin() {
    if (!UserService.to.isLogin) {
      Get.toNamed(Routes.JOB_LOGIN);
    }
  }

  loadData() {
    if (UserService.to.isLogin) {
      // 获取收藏数
      JobApi.to.getCollectnum(success: (data) {
        collectNum = data;
        update();
      });

      historyNum = UserService.to.getBrowseHistoryLength();
    }
  }
}
