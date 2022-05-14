import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 装载GetxController
/// 装载GetBuilder状态管理
/// 注入Bingding
/// keep-alive => AutomaticKeepAliveClientMixin
/// WidgetsBindingObserver
abstract class GetzViewKeepAlive<T extends GetxController>
    extends StatefulWidget {
  const GetzViewKeepAlive({Key? key}) : super(key: key);

  final String? tag = null;

  /// 注入控制器
  T get controller => GetInstance().find<T>(tag: tag);

  /// Get局部更新字段
  get updateId => null;

  /// widget生命周期
  get lifecycle => null;

  @protected
  Bindings? binding();

  @protected
  Widget build(BuildContext context);

  @override
  State<GetzViewKeepAlive> createState() => _GetzViewKeepAliveState<T>();
}

/// WidgetsBindingObserver 监控生命周期
///   didPopRoute
///   didPushRoute
///   didPushRouteInformation
///   didChangeMetrics 应用尺寸改变时回调，例如旋转
///   didChangeTextScaleFactor 文字系数变化
///   didChangePlatformBrightness
///   didChangeLocales 用户本地设置变化时调用，如系统语言改变
///   didChangeAppLifecycleState App生命周期
///   didHaveMemoryPressure 低内存回调
///   didChangeAccessibilityFeatures
class _GetzViewKeepAliveState<S extends GetxController>
    extends State<GetzViewKeepAlive>
    with
        AutomaticKeepAliveClientMixin<GetzViewKeepAlive>,
        WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<S>(
        id: widget.updateId,
        builder: (controller) {
          return widget.build(context);
        });
  }

  @override
  void initState() {
    super.initState();
    widget.binding()?.dependencies();
    if (widget.lifecycle != null) {
      WidgetsBinding.instance.addObserver(this);
    }
  }

  @override
  void dispose() {
    Get.delete<S>();
    if (widget.lifecycle != null) {
      WidgetsBinding.instance.removeObserver(this);
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    /// AppLifecycleState =》 App的生命周期
    ///   resumed: 应用可见并可响应用户操作
    ///   inactive: 用户可见，但不可响应用户操作
    ///   paused: 已经暂停了，用户不可见、不可操作
    ///   suspending: 应用被挂起，此状态IOS永远不会回调
    super.didChangeAppLifecycleState(state);
    if (widget.lifecycle != null) {
      widget.lifecycle(state);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
