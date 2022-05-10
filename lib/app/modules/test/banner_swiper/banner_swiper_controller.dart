import 'package:get/get.dart';
import 'package:getx_test/app/data/repositorys/wan_android_api.dart';

import '../../../data/models/banner.dart';

class BannerSwiperController extends GetxController {
  late WanAndroidApi wanAndroidApi;
  final banners = Rx<List<Banner>?>([]);

  loadBanners() async {
    // wanAndroidApi.getBanners(
    //   success: (data) => banners.value = data,
    // );
  }

  @override
  void onInit() {
    super.onInit();
    wanAndroidApi = Get.find<WanAndroidApi>();
  }

  @override
  void onReady() {
    loadBanners();
    super.onReady();
  }

  @override
  void onClose() {}
}
