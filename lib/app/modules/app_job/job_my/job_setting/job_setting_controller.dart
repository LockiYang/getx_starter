import 'package:get/get.dart';
import 'package:getx_test/app/modules/app_job/services/config_service.dart';
import 'package:getx_test/app/modules/app_job/services/user_service.dart';

import '../../../../common/utils/file_util.dart';
import '../../../../common/utils/toast_util.dart';
import '../../../../routes/app_pages.dart';

class JobSettingController extends GetxController {
  String cacheSize = '';

  @override
  void onInit() {
    super.onInit();
    loadCache();
  }

  @override
  void onClose() {}

  void changeRecommend(value) {
    ConfigService.to.setIsAppRecommend(value);
    if (value) {
      ToastUtil.show('个性化推荐已开启');
    } else {
      ToastUtil.show('个性化推荐已关闭');
    }
  }

  /// 获取缓存大小
  loadCache() {
    FileUtil.loadCache().then((value) {
      cacheSize = FileUtil.byte2FitMemorySize(value);
      update();
    });
  }

  ///清除缓存
  clearCache() {
    FileUtil.clearCache().then((value) {
      loadCache();
      ToastUtil.show(value ? '清除成功' : '清除失败');
    });
  }

  logout() {
    UserService.to.logout();
    Get.until((route) => Get.currentRoute == Routes.APP_JOB);
  }
}
