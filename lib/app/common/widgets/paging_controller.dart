import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class PagingController<T> extends GetxController {
  /// 当前页码
  int pageIndex = 1;

  /// 是否更多数据
  bool hasMore = true;

  /// 列表数据
  List<T> data = <T>[];

  /// 加载状态: 0加载中 1加载成功 2加载数据为空 3加载失败
  var loadStatus = 0;

  RefreshController refreshController =  RefreshController(initialRefresh: false);

  @override
  void onReady() {
    super.onReady();
    /// 进入页面刷新数据
    refreshData();
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }

  /// 刷新数据
  void refreshData() async {
    pageIndex = 0;
    hasMore = true;
    List<T> datas = await loadData();
    data.clear();
    data.addAll(datas);
    refreshController.refreshCompleted();
    if (refreshController.footerStatus == LoadStatus.noMore) {
      refreshController.resetNoData();
    }
    loadStatus = 1;
    update();
  }

  /// 加载更多
  void loadMoreData() async{
    List<T> datas = await loadData();
    data.addAll(datas);
    /// 加载完成
    if (hasMore) {
      refreshController.loadComplete();
    } else {
      refreshController.loadNoData();
    }
    update();
  }

  Future<List<T>> loadData();
}
