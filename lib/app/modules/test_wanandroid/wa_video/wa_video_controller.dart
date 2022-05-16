import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/common/utils/toast_util.dart';
import 'package:getx_test/app/modules/test_wanandroid/data/eyepetizer_api.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../data/feed.dart';

class WaVideoController extends GetxController {

  /// 是否首次加载
  bool isInit = true;

  /// 当前页码
  int currentPage = 0;

  /// 加载状态: 0加载中 1加载成功 2加载数据为空 3加载失败
  int loadStatus = 0;

  /// 是否更多数据
  bool hasMore = true;

  /// 加载数据，可以加载多个数据，但只能一个是分页数据=itemList
  List<FeedIssueListItemList?> bannerList = [];
  List<FeedIssueListItemList?> itemList = [];

  /// 下一页Url
  String? nextPageUrl;

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  final ScrollController scrollController = ScrollController();
  final SwiperController swiperController = SwiperController();

  late EyepetizerApi eyepetizerApi;

  /// 刷新数据
  void refreshData() async {
    eyepetizerApi.getFeed(0, success: (data) {
      bannerList = [];
      nextPageUrl = data.nextPageUrl;
      bannerList.addAll(data.issueList![0]!.itemList!);
      loadStatus = 1;
      refreshController.refreshCompleted();

      loadingData();
      update();
    }, fail: (error) {
      loadStatus = currentPage == 0 ? 2 : 1;
      ToastUtil.show(error.message);
    });
  }

  /// 加载更多
  void loadingData() async {
    eyepetizerApi.getFeed(currentPage, success: (data) {
      nextPageUrl = data.nextPageUrl;
      itemList.addAll(data.issueList![0]!.itemList!);
      loadStatus = 1;
      ++currentPage;
      refreshController.loadComplete();
      update();
    }, fail: (error) {});
  }

  @override
  void onInit() {
    super.onInit();
    eyepetizerApi = Get.find<EyepetizerApi>();
  }

  @override
  void onReady() {
    super.onReady();
    refreshData();
  }

  @override
  void onClose() {}
}
