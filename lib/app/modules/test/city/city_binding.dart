import 'package:get/get.dart';

import 'city_controller.dart';


class CityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CityController>(
      () => CityController(),
    );
  }
}
