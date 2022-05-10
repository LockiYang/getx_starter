import 'package:get/get.dart';

import '../../../../utils/cache_util.dart';
import '../../../../utils/toast_util.dart';

class WaSettingController extends GetxController {

  String cacheSize = '';


  /// 获取缓存大小
  loadCache(){
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

  @override
  void onInit() {
    super.onInit();
    loadCache();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
