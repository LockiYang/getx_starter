import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/common/utils/toast_util.dart';
import 'package:getx_test/app/modules/app_job/data/repositorys/job_api.dart';

class JobAddingInfoController extends GetxController {
  List<InfoItem> infoItems = [];
  @override
  void onInit() {
    JobApi.to.getBasicInfoConfig(
      success: (data) {
        infoItems = (data as List<dynamic>)
            .map((e) => InfoItem.fromJson(e as Map<String, dynamic>))
            .toList();
        update();
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  submit() {
    List tags = [];
    for (var item in infoItems) {
      int index = item.selectIndex;
      if (index != -1) {
        tags.add(item.selDescs[index]);
      }
    }
    if (tags.isEmpty) {
      ToastUtil.show('请选择');
      return;
    }
    JobApi.to.saveBasicInfo(
      tags.join(','),
      success: (data) => Get.back(),
    );
  }
}

class InfoItem {
  late String title;
  late List<String> selDescs;
  late int selectIndex;

  InfoItem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    selDescs = json['selDescs'].cast<String>();
    selectIndex = json['selectIndex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['selDescs'] = selDescs;
    data['selectIndex'] = selectIndex;
    return data;
  }
}
