import 'package:get/get.dart';

import 'widget/city_model.dart';

class CityController extends GetxController {
  List<CityModel> hotCityList = [];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    hotCityList.addAll([
      CityModel(name: "北京市"),
      CityModel(name: "广州市"),
      CityModel(name: "成都市"),
      CityModel(name: "深圳市"),
      CityModel(name: "杭州市"),
      CityModel(name: "武汉市"),
    ]);
  }

  @override
  void onClose() {}
}
