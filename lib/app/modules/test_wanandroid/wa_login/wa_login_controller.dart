import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WaLoginController extends GetxController {
  bool checked = true;

  changeChecked(value) {
    debugPrint(value.toString());
    checked = value;
    update();
  }
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
