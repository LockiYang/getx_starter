import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 自动绑定GetxController
/// 自动装载状态管理
abstract class GetzView<T extends GetxController> extends StatefulWidget {
  const GetzView({Key? key}) : super(key: key);

  final String? tag = null;

  T get controller => GetInstance().find<T>(tag: tag);
  get updateId => null;

  @protected
  Widget build(BuildContext context);

  @override
  State<GetzView> createState() => _GetzViewState<T>();
}

class _GetzViewState<S extends GetxController> extends State<GetzView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<S>(
        id: widget.updateId,
        builder: (controller) {
          return widget.build(context);
        },
        tag: widget.tag);
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<S>();
  }
}
