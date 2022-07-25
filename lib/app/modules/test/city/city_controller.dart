import 'package:bruno/bruno.dart';
import 'package:get/get.dart';

class CityController extends GetxController {
  List<BrnSelectCityModel> hotCityList = [];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    hotCityList.addAll([
      BrnSelectCityModel(name: "北京市"),
      BrnSelectCityModel(name: "广州市"),
      BrnSelectCityModel(name: "成都市"),
      BrnSelectCityModel(name: "深圳市"),
      BrnSelectCityModel(name: "杭州市"),
      BrnSelectCityModel(name: "武汉市"),
    ]);
  }

  @override
  void onClose() {}
}
