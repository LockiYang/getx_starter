import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'city_controller.dart';

class CityView extends GetView<CityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BrnSingleSelectCityPage(
        locationText: '深圳市',
        showSearchBar: false,
        appBarTitle: '城市单选',
        hotCityTitle: '这里是推荐城市',
        hotCityList: controller.hotCityList,
      ),
    );
  }
}
