import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
 TextEditingController textEditingController  = TextEditingController();

  late ValueNotifier<bool> valueNotifier;
  FocusNode? focusNode;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    // textEditingController = TextEditingController();
    valueNotifier = ValueNotifier(false);
    focusNode = FocusNode();
    focusNode!.addListener(() {
      if (focusNode!.hasFocus) {
        valueNotifier.value = true;
      }
    });
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
