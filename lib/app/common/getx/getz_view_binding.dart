import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 装载GetxController
/// 装载GetBuilder状态管理
/// 注入Bingding
abstract class GetzViewBindng<T extends GetxController> extends StatefulWidget {
  const GetzViewBindng({Key? key}) : super(key: key);

  final String? tag = null;

  T get controller => GetInstance().find<T>(tag: tag);

  @protected
  Widget build(BuildContext context);

  @protected
  Bindings? binding();

  @override
  State<GetzViewBindng> createState() => _GetzViewBindngState<T>();
}

class _GetzViewBindngState<S extends GetxController>
    extends State<GetzViewBindng> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<S>(builder: (controller) {
      return widget.build(context);
    });
  }

  @override
  void initState() {
    super.initState();
    widget.binding()?.dependencies();
  }

  @override
  void dispose() {
    Get.delete<S>();
    super.dispose();
  }
}
