
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/banner/banner_model.dart';
import '../data/wan_android_api.dart';

class WaHomeController extends GetxController with GetSingleTickerProviderStateMixin {
  late WanAndroidApi wanAndroidApi;
  late TabController tabController;
  var banners = <BannerModel>[];

  getBanners() {
    wanAndroidApi.getBanners(
      success: (data) {
        banners.addAll(data);
        for (var e in data) {
          precacheImage(NetworkImage(e.imagePath), Get.context!);
        }
        update();
      }
    );
  }

  @override
  void onInit() {
    super.onInit();
    wanAndroidApi = Get.find<WanAndroidApi>();
    tabController = TabController(length: 3, vsync: this);
    getBanners();
  }

  @override
  void onClose() {}
}
