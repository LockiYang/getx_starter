import 'package:get/get.dart';
import 'package:getx_test/app/data/repositorys/wan_android_api.dart';

import '../../../../routes/app_pages.dart';
import '../../../../utils/cache_util.dart';
import '../../../../utils/toast_util.dart';

class WaSettingController extends GetxController {
  late WanAndroidApi wanAndroidApi;

  String cacheSize = '';

  /// 获取缓存大小
  loadCache() {
    CacheUtil.loadCache().then((value) {
      cacheSize = CacheUtil.byte2FitMemorySize(value);
      update();
    });
  }

  ///清除缓存
  clearCache() {
    CacheUtil.clearCache().then((value) {
      loadCache();
      ToastUtil.show(value ? '清除成功' : '清除失败');
    });
  }

  logout() {
    // CacheUtil.deleteUserInfo();
    // wanAndroidApi.logout();
    // Get.offAllNamed(Routes.TEST_WANANDROID);
    Get.offNamed(Routes.TEST_WANANDROID);
  }

  @override
  void onInit() {
    super.onInit();
    wanAndroidApi = Get.find<WanAndroidApi>();
    loadCache();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
