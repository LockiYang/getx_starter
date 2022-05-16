import 'package:flutter/material.dart';
import 'package:getx_test/app/common/widgets/paging_controller.dart';
import 'package:lottie/lottie.dart';
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
    return _PagingRefreshWidgetState<T>();
  }
}

class _PagingRefreshWidgetState<T extends PagingController>
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
          /// 加载成功
          GetBuilder<T>(
            builder: (controller) => Visibility(
                visible: controller.loadStatus == 1,
                child: SmartRefresher(
                    controller: controller.refreshController,
                    enablePullDown: widget.enablePullDown,
                    enablePullUp: widget.enablePullUp,
                    onRefresh: () => controller.refreshData(),
                    onLoading: () => controller.loadMoreData(),
                    header: _buildHeader(),
                    footer: _buildFooter(),
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
                  child: Lottie.asset('assets/lotties/page_loading_anim.json',
                      width: 200, height: 200, animate: true),
                )),
            tag: widget.tag,
          ),

          ///加载数据为空
          GetBuilder<T>(
            builder: (controller) => Visibility(
              visible: controller.loadStatus == 2,
              child: Lottie.asset('assets/lotties/refresh_empty_page.json',
                  width: 200, height: 200, animate: true),
            ),
            tag: widget.tag,
          ),

          ///加载出错的页面
          GetBuilder<T>(
            builder: (controller) => Visibility(
              visible: controller.loadStatus == 3,
              child: Lottie.asset('assets/lotties/refresh_error.json',
                  width: 200, height: 200, animate: true),
            ),
            tag: widget.tag,
          ),
        ],
      ),
    );
  }

  CustomFooter _buildFooter() {
    return CustomFooter(
      builder: (BuildContext context, LoadStatus? mode) {
        Widget footer;
        if (mode == LoadStatus.idle) {
          ///下拉提示
          footer = const Text("pull up load");
        } else if (mode == LoadStatus.loading) {
          ///加载中
          footer = Lottie.asset('assets/lotties/refresh_footer.json',
              width: 200, animate: true);
        } else if (mode == LoadStatus.failed) {
          ///加载失败
          footer = Text('加载失败');
        } else {
          ///无更多数据
          footer = Text('没有更多数据啦');
        }
        return SizedBox(
          height: 60,
          child: Center(child: footer),
        );
      },
    );
  }

  CustomHeader _buildHeader() {
    return CustomHeader(
      builder: (BuildContext context, RefreshStatus? mode) {
        Widget header;
        switch (mode) {
          case RefreshStatus.idle:
            // 下拉时显示
            header = Text('上拉刷新');
            break;
          case RefreshStatus.refreshing:
            // 加载中
            header = Lottie.asset('assets/lotties/refresh_head_loading.json',
                width: 100, animate: true);
            break;
          case RefreshStatus.failed:
            // 加载失败
            header = Text('刷新失败');
            break;
          case RefreshStatus.completed:
            // 加载成功
            header = Text('刷新成功');
            break;
          default:
            // 超过二层
            header = Text('釋放刷新');
        }
        return SizedBox(
          height: 64,
          child: Center(child: header),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
