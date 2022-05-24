import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../data/models/pagination.dart';
import '../data/models/post.dart';
import '../data/repositorys/job_api.dart';
import '../services/user_service.dart';

class JobMessageController extends GetxController {
  int currentPage = 1;
  int loadStatus = 0;
  bool hasMore = true;
  List<Post> data = [];
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
    if (UserService.to.isLogin) {
      refreshData();
    }
  }

  @override
  void onClose() {}

  /// 刷新数据
  refreshData() async {
    loadStatus = 0;
    currentPage = 1;
    List<Post> datas = await loadData();
    data.clear();
    data.addAll(datas);
    refreshController.refreshCompleted();
    if (!hasMore) {
      refreshController.loadNoData();
    } else {
      refreshController.loadComplete();
    }
    loadStatus = 1;
    update();
  }

  /// 加载更多
  loadingData() async {
    currentPage++;
    List<Post> datas = await loadData();
    data.addAll(datas);

    /// 加载完成
    if (hasMore) {
      refreshController.loadComplete();
    } else {
      refreshController.loadNoData();
    }
    update();
  }

  Future<List<Post>> loadData() async {
    Pagination<Post> result = await JobApi.to.getPostSubscribePage(currentPage);
    if (result.pageNum < result.pages) {
      hasMore = true;
    } else {
      hasMore = false;
    }
    return result.data;
  }
}
