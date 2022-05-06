import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:get/get.dart';

import 'over_scroll_behavior.dart';

///刷新状态
enum Refresh {
  ///首次加载
  first,

  ///上拉刷新
  up,

  ///下拉加载
  down,
}

/// 上拉刷新、下拉加载、空白页加载动画
/// 通过在基类BaseGetController中维护上拉刷新、下拉加载、控制器等等状态
/// 不需要暴露给使用者，当然，此方法只能使用Getx框架有效
class RefreshWidget<WaProjectController> extends StatefulWidget {
  RefreshWidget({
    Key? key,
    this.enablePullUp = true,
    this.enablePullDown = true,
    this.onRefresh,
    this.onLoadMore,
    required this.child,
  }) : super(key: key);

  final String? tag = null;

  ///获取BaseGetController子类对象，在GetX中，任何BaseGetController都可以通过此方法获取
  ///但是必须是没有dispose的Controller
  WaProjectController get getController =>
      GetInstance().find<WaProjectController>(tag: tag);

  ///是否启用上拉
  bool enablePullUp = true;

  ///是否启用下拉
  bool enablePullDown = true;

  ///下拉刷新回调
  VoidCallback? onRefresh;

  ///上拉加载回调
  VoidCallback? onLoadMore;

  ///子类，必须是ListView
  Widget child;

  @override
  State<StatefulWidget> createState() {
    return RefreshWidgetState();
  }
}

class RefreshWidgetState extends State<RefreshWidget>
    with AutomaticKeepAliveClientMixin {
  RefreshController controller = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    widget.getController.initLoad(controller);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ///上下刷新、下拉加载控件
          Obx(() => Visibility(
              visible: widget.getController.loadStatus.value == 1,
              child: ScrollConfiguration(
                behavior: OverScrollBehavior(),
                child: SmartRefresher(
                    controller: controller,
                    enablePullDown: widget.enablePullDown,
                    enablePullUp: widget.enablePullUp,
                    onRefresh: () => widget.getController.onRefresh(controller),
                    onLoading: () => widget.getController.onLoading(controller),
                    child: widget.child),
              ))),

          ///未加载前显示的动画，加载之后需要隐藏
          Obx(
            () => Visibility(
                visible: widget.getController.loadStatus.value == 0,
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Text('加载中'),
                )),
          ),

          ///加载数据为空的页面
          Obx(
            () => Visibility(
                visible: widget.getController.loadStatus.value == 2,
                child: Text('数据为空')),
          ),

          ///加载出错的页面
          Obx(() => Visibility(
                visible: widget.getController.loadStatus.value == 3,
                child: Text('加载出错'),
              )),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
