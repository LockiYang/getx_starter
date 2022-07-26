import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'city_controller.dart';
import 'widget/select_city_page.dart';

class CityView extends GetView<CityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectCityPage(
        locationText: '深圳市',
        // showSearchBar: true,
        appBarTitle: '城市单选',
        hotCityTitle: '这里是推荐城市',
        hotCityList: controller.hotCityList,
      ),
    );
  }
}
