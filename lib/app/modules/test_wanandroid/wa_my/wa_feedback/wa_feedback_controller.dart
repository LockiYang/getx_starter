import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/utils/toast_util.dart';
import 'package:image_picker/image_picker.dart';

class WaFeedbackController extends GetxController {

  List<File> photoEntity = [];
  String issue = '';
  String contact = '';

  /// 打开相册
  /// [index] 索引
  openGallery(int index) async {
    if (photoEntity.length >= 4) {
      ToastUtil.show('最多选择4张哟');
      return;
    }
    if (index == photoEntity.length) {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        photoEntity.add(File(image.path));
      }
      update();
    }
  }

  ///由于没有反馈接口，因此延时2秒进行操作
  requestFeedback(BuildContext context){
    debugPrint("feedback >> issue == $issue");
    debugPrint("feedback >> contact == $contact");
    debugPrint("feedback >> photo == $photoEntity");
    if(issue.isEmpty){
      ToastUtil.show('请填写反馈内容');
      return;
    }
    // KeyboardUtils.hideKeyboard(context);
    // Get.showLoading();
    Future.delayed(const Duration(seconds: 2)).then((value){
      // Get.dismiss();
      ToastUtil.show('反馈成功');
      Get.back();
    });
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
