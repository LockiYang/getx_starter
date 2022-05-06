import 'package:get/get.dart';
import 'package:getx_test/app/utils/refresher_extension.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../common/widgets/pull_smart_refresher.dart';
import '../../../data/models/project.dart';
import '../../../data/repositorys/wan_android_api.dart';

class WaProjectController extends GetxController {
  late WanAndroidApi wanAndroidApi;
  late RefreshController refreshController;
  final projects = <Project>[].obs;

  ///加载状态：0加载中 1加载成功 2加载数据为空 3加载失败
  var loadStatus = 0.obs;
  int pageNum = 1;

  ///是否初次加载
  var isFirst = true;

  requestData(RefreshController refreshController,
      {Refresh refresh = Refresh.down}) {
    wanAndroidApi.getProjects(pageNum, success: (data, over) {
      RefreshExtension.onSuccess(refreshController, refresh, over);
      //下拉刷新需要清除列表
      if (refresh != Refresh.up) {
        projects.clear();
      }
      projects.addAll(data);
      showSuccess(projects);
    }, fail: (code, msg) {
      showError();
      RefreshExtension.onError(refreshController, refresh);
    });
  }

  initLoad(RefreshController refreshController) {
    if (isFirst) {
      this.refreshController = refreshController;
      requestData(refreshController);
    }
  }

  ///加载成功，是否显示空页面
  showSuccess(List list) {
    loadStatus.value = list.isNotEmpty ? 1 : 2;
  }

  ///加载失败,显示失败页面
  showError() {
    loadStatus.value = 3;
  }

  ///重新加载
  showLoading() {
    loadStatus.value = 0;
  }

  ///下拉刷新
  onRefresh(RefreshController controller) {
    pageNum = 1;
    requestData(controller, refresh: Refresh.down);
  }

  ///上拉加载
  onLoading(RefreshController controller) {
    ++pageNum;
    requestData(controller, refresh: Refresh.up);
  }

  @override
  void onInit() {
    super.onInit();
    wanAndroidApi = Get.find<WanAndroidApi>();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
