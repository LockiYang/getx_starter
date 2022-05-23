import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/modules/test/sliver_widgets/widgets/nested_usage.dart';

import 'widgets/basic_usage.dart';
import 'widgets/custom_sliver_header_usage.dart';
import 'widgets/float_usage.dart';
import 'widgets/pinned_usage.dart';
import 'widgets/snap_usage.dart';
import 'widgets/sticky_usage.dart';

class SliverWidgetsController extends GetxController {
  final List<DemoViewModal> demos = [
    DemoViewModal(
      title: 'CustomScrollView 基本用法',
      demo: BasicDemo(title: 'CustomScrollView 基本用法'),
    ),
    DemoViewModal(
      title: 'SliverAppBar - float效果',
      demo: FloatDemo(title: 'SliverAppBar - float效果'),
    ),
    DemoViewModal(
      title: 'SliverAppBar - snap效果',
      demo: SnapDemo(title: 'SliverAppBar - float效果'),
    ),
    DemoViewModal(
      title: 'SliverAppBar - pinned效果',
      demo: PinnedDemo(title: 'SliverAppBar - float效果'),
    ),
    DemoViewModal(
      title: 'SliverPersistentHeader - sticky效果',
      demo: StickyDemo(title: 'SliverPersistentHeader - sticky效果'),
    ),
    DemoViewModal(
      title: 'Sliver - 自定义效果',
      demo: CustomSliverHeaderDemo(),
    ),
    DemoViewModal(
      title: 'NestedScrollView 基本用法',
      demo: NestedUsage(),
    ),
  ];



  @override
  void onClose() {}
}

class DemoViewModal {
  final String title;
  final Widget demo;

  DemoViewModal({required this.title, required this.demo});
}
