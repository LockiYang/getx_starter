import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/demo_tabs.dart';
import 'widgets/credit_card.dart';
import 'widgets/friend_circle.dart';
import 'widgets/mock_data.dart';
import 'widgets/pet_card.dart';

class BasicWidgetsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  List<DemoTabViewModel> demos = [
    DemoTabViewModel(
        title: '宠物卡片',
        widget: Column(
          mainAxisSize: MainAxisSize.min,
          children: [PetCard(data: petCardData)],
        )),
    DemoTabViewModel(
        title: '银行卡',
        widget: Column(
          mainAxisSize: MainAxisSize.min,
          children: [CreditCard(data: creditCardData)],
        )),
    DemoTabViewModel(
        title: '微信朋友圈',
        widget: Column(
          mainAxisSize: MainAxisSize.min,
          children: [FriendCircle(data: friendCircleData)],
        )),
  ];

  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: demos.length, vsync: this);
  }


  @override
  void onClose() {}
}
