import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class GetzViewKeepAlive<T extends GetxController>
    extends StatefulWidget {
  const GetzViewKeepAlive({Key? key}) : super(key: key);

  final String? tag = null;

  T get controller => GetInstance().find<T>(tag: tag);

  /// Get 局部更新字段
  get updateId => null;

  /// widget生命周期
  get lifecycle => null;

  @protected
  Widget build(BuildContext context);

  @override
  State<GetzViewKeepAlive> createState() => _GetzViewKeepAliveState<T>();
}

/// AutomaticKeepAliveClientMixin 在flutter中如果切换tabar,则initState方法会被反复重调,若想保持原有状态,切换页面时不再调用initState方法,则需使用AutomaticKeepAliveClientMixin.
/// 同Vue中的<keep-alive>使用原理一样，<keep-alive> 包裹动态组件时，会缓存不活动的组件实例，而不是销毁它们。
/// WidgetsBindingObserver 想要知道Flutter App的生命周期
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
    /// 想要知道Flutter App的生命周期
    if (widget.lifecycle != null) {
      WidgetsBinding.instance.addObserver(this);
    }
  }

  /// 当 View 不需要再显示，从渲染树中移除的时候，State 就会永久的从渲染树中移除，就会调用 dispose 生命周期，这时候就可以在 dispose 里做一些取消监听、动画的操作，和 initState 是相反的
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
    /// AppLifecycleState 就是 App 的生命周期
    /// resumed inactive paused suspending
    super.didChangeAppLifecycleState(state);
    if (widget.lifecycle != null) {
      widget.lifecycle(state);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
