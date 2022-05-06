import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'banner_swiper_controller.dart';

class BannerSwiperView extends GetView<BannerSwiperController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BannerSwiperView'),
        centerTitle: true,
      ),
      body: Obx(() => Swiper(
          itemCount: controller.banners.value!.length,
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              controller.banners.value![index].imagePath,
              fit: BoxFit.fitWidth,
            );
          },
          pagination: SwiperPagination(),
          control: SwiperControl())),
    );
  }
}
