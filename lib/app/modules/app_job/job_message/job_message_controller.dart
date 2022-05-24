import 'package:get/get.dart';
import 'package:getx_test/app/modules/app_job/services/user_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../data/models/pagination.dart';
import '../data/models/post.dart';
import '../data/repositorys/job_api.dart';

class JobMessageController extends GetxController {
  int currentPage = 1;
  int loadStatus = 0;
  bool hasMore = true;
  List<Post> data = [];
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  bool enabledPullUpDown = false;

  @override
  void onClose() {}

  refreshPage() {
    if (UserService.to.isLogin.value) {
      refreshData();
    } else {
      data = [];
    }
    update();
  }

  /// 刷新数据
  refreshData() async {
    if (!UserService.to.isLogin.value) {
      refreshController.refreshCompleted();
      refreshController.loadNoData();
      return;
    }
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
    if (!UserService.to.isLogin.value) {
      refreshController.loadComplete();
      refreshController.loadNoData();
      return;
    }
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
