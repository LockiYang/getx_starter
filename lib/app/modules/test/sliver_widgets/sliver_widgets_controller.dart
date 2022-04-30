import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/basic_usage.dart';
import 'widgets/custom_sliver_header_usage.dart';
import 'widgets/float_usage.dart';
import 'widgets/pinned_usage.dart';
import 'widgets/snap_usage.dart';
import 'widgets/sticky_usage.dart';

class SliverWidgetsController extends GetxController {
  final List<DemoViewModal> demos = [
    DemoViewModal(
      title: 'Sliver - Grid和List混合使用',
      demo: BasicDemo(title: 'Sliver - Grid和List混合使用'),
    ),
    DemoViewModal(
      title: 'Sliver - float效果',
      demo: FloatDemo(title: 'Sliver - float效果'),
    ),
    DemoViewModal(
      title: 'Sliver - snap效果',
      demo: SnapDemo(title: 'Sliver - snap效果'),
    ),
    DemoViewModal(
      title: 'Sliver - pinned效果',
      demo: PinnedDemo(title: 'Sliver - pinned效果'),
    ),
    DemoViewModal(
      title: 'Sliver - sticky效果',
      demo: StickyDemo(title: 'Sliver - sticky效果'),
    ),
    DemoViewModal(
      title: 'Sliver - 自定义效果',
      demo: CustomSliverHeaderDemo(),
    ),
  ];

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

class DemoViewModal {
  final String title;
  final Widget demo;

  DemoViewModal({required this.title, required this.demo});
}
