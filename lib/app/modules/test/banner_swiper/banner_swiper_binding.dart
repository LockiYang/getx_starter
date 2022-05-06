import 'package:get/get.dart';

import 'banner_swiper_controller.dart';

class BannerSwiperBinding extends Bindings {
  @override
  void dependencies() {
    /// 页面需要初始化数据就不能用懒加载
    // Get.lazyPut<BannerSwiperController>(
    //   () => BannerSwiperController(),
    // );
    Get.put<BannerSwiperController>(BannerSwiperController());
  }
}
