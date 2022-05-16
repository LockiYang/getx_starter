import 'package:get/get.dart';
import 'package:getx_test/app/data/repositorys/wan_android_api.dart';

import '../../common/cache_util.dart';
import '../../../../common/utils/file_util.dart';
import '../../../../common/utils/toast_util.dart';
import '../../../../routes/app_pages.dart';

class WaSettingController extends GetxController {
  late WanAndroidApi wanAndroidApi;

  String cacheSize = '';

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
    CacheUtil.deleteUserInfo();
    // wanAndroidApi.logout();
    // Get.offAllNamed(Routes.TEST_WANANDROID);
    Get.until((route) => Get.currentRoute == Routes.TEST_WANANDROID);
    // Get.back()
    // Get.offAllNamed(Routes.TEST_WANANDROID);
  }

  @override
  void onInit() {
    super.onInit();
    wanAndroidApi = Get.find<WanAndroidApi>();
    loadCache();
  }

  @override
  void onClose() {}
}
