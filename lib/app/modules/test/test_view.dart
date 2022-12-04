import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import 'test_controller.dart';
import 'widgets/picker/multi_picker.dart';

class TestView extends GetView<TestController> {
  @override
  Widget build(BuildContext context) {
    // ScreenUtil.removeStatusBarTransparent(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          bottom: false,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BrnActionCardTitle(
                    title: '基础组件',
                    onTap: () => Get.toNamed(Routes.BASIC_WIDGETS),
                  ),
                  BrnActionCardTitle(
                    title: '自定义图标',
                    onTap: () => Get.toNamed(Routes.CUSTOM_ICON),
                  ),
                  BrnActionCardTitle(
                    title: 'ListView',
                    onTap: () => Get.toNamed(Routes.LIST_VIEW),
                  ),
                  BrnActionCardTitle(
                    title: 'GridView',
                    onTap: () => Get.toNamed(Routes.GRID_VIEW),
                  ),
                  BrnActionCardTitle(
                    title: 'Sliver系列组件',
                    onTap: () => Get.toNamed(Routes.SLIVER_WIDGETS),
                  ),
                  BrnActionCardTitle(
                    title: 'News APP',
                    onTap: () => Get.toNamed(Routes.TEST_NEWS),
                  ),
                  BrnActionCardTitle(
                    title: 'WanAndroid APP',
                    onTap: () => Get.toNamed(Routes.TEST_WANANDROID),
                  ),
                  BrnActionCardTitle(
                    title: '小组件',
                    onTap: () => Get.toNamed(Routes.LITTLE_WIDGETS),
                  ),
                  BrnActionCardTitle(
                    title: 'Device Info',
                    onTap: () => Get.toNamed(Routes.DEVICE_INFO),
                  ),
                  BrnActionCardTitle(
                    title: 'CITY',
                    onTap: () => Get.toNamed(Routes.CITY),
                  ),
                  BrnActionCardTitle(
                    title: 'SEARCH',
                    onTap: () {
                      MultiDataPicker(
                        context: context,
                        title: '来源',
                        delegate: Brn1RowDelegate(firstSelectedIndex: 1),
                        confirmClick: (list) {
                          BrnToast.show(list.toString(), context);
                        },
                      ).show();
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

List<Map<String, List>> list = [
  {'AAA': []},
  {'BBB': []},
  {'CCC': []},
  {'DDD': []}
];

class Brn1RowDelegate implements MultiDataPickerDelegate {
  int firstSelectedIndex = 0;
  int secondSelectedIndex = 0;
  int thirdSelectedIndex = 0;

  Brn1RowDelegate({this.firstSelectedIndex = 0, this.secondSelectedIndex = 0});

  @override
  int numberOfComponent() {
    return 1;
  }

  @override
  int numberOfRowsInComponent(int component) {
    if (0 == component) {
      return list.length;
    } else if (1 == component) {
      Map<String, List> secondMap = list[firstSelectedIndex];
      return secondMap.values.first.length;
    } else {
      Map<String, List> secondMap = list[firstSelectedIndex];
      Map<String, List> thirdMap = secondMap.values.first[secondSelectedIndex];
      return thirdMap.values.first.length;
    }
  }

  @override
  String titleForRowInComponent(int component, int index) {
    if (0 == component) {
      return list[index].keys.first;
    } else if (1 == component) {
      Map<String, List> secondMap = list[firstSelectedIndex];
      List secondList = secondMap.values.first;
      return secondList[index].keys.first;
    } else {
      Map<String, List> secondMap = list[firstSelectedIndex];
      Map<String, List> thirdMap = secondMap.values.first[secondSelectedIndex];
      return thirdMap.values.first[index];
    }
  }

  @override
  double? rowHeightForComponent(int component) {
    return null;
  }

  @override
  selectRowInComponent(int component, int row) {
    if (0 == component) {
      firstSelectedIndex = row;
    } else if (1 == component) {
      secondSelectedIndex = row;
    } else {
      thirdSelectedIndex = row;
      debugPrint('_thirdSelectedIndex  is selected to $thirdSelectedIndex');
    }
  }

  @override
  int initSelectedRowForComponent(int component) {
    if (0 == component) {
      return firstSelectedIndex;
    }
    return 0;
  }
}
