import 'package:flutter/material.dart';
import 'package:getx_test/app/common/widgets/paging_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:get/get.dart';

class PagingRefreshWidget<T extends PagingController> extends StatefulWidget {
  PagingRefreshWidget({
    Key? key,
    this.tag,
    this.enablePullUp = true,
    this.enablePullDown = true,
    this.onRefresh,
    this.onLoadMore,
    required this.child,
  }) : super(key: key);

  final String? tag;

  ///是否启用上拉
  final bool enablePullUp;

  ///是否启用下拉
  final bool enablePullDown;

  ///下拉刷新回调
  final VoidCallback? onRefresh;

  ///上拉加载回调
  final VoidCallback? onLoadMore;

  ///子类，必须是ListView
  final Widget child;

  @override
  State<StatefulWidget> createState() {
    return PagingRefreshWidgetState<T>();
  }
}

class PagingRefreshWidgetState<T extends PagingController>
    extends State<PagingRefreshWidget> with AutomaticKeepAliveClientMixin {
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
          GetBuilder<T>(
            builder: (controller) => Visibility(
                visible: controller.loadStatus == 1,
                child: SmartRefresher(
                    controller: controller.refreshController,
                    enablePullDown: widget.enablePullDown,
                    enablePullUp: widget.enablePullUp,
                    onRefresh: () => controller.refreshData(),
                    onLoading: () => controller.loadMoreData(),
                    child: widget.child)),
            tag: widget.tag,
          ),

          ///加载中
          GetBuilder<T>(
            builder: (controller) => Visibility(
                visible: controller.loadStatus == 0,
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Text('加载中'),
                )),
            tag: widget.tag,
          ),

          ///加载数据为空
          GetBuilder<T>(
            builder: (controller) => Visibility(
                visible: controller.loadStatus == 2, child: Text('数据为空')),
            tag: widget.tag,
          ),

          ///加载出错的页面
          GetBuilder<T>(
            builder: (controller) => Visibility(
              visible: controller.loadStatus == 3,
              child: Text('加载出错'),
            ),
            tag: widget.tag,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
