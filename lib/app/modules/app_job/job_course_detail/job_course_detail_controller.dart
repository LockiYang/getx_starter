import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/common/utils/toast_util.dart';
import 'package:getx_test/app/modules/app_job/data/models/index.dart';
import 'package:getx_test/app/modules/app_job/data/repositorys/job_api.dart';
import 'package:getx_test/app/modules/app_job/services/user_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wakelock/wakelock.dart';

import '../../../common/widgets/fijkplayer/fijkplayer_skin.dart';
import '../../../routes/app_pages.dart';
import '../data/models/pagination.dart';
import '../job_adding_info/job_adding_info_controller.dart';

class JobCourseDetailController extends GetxController {
  String? postId;
  String title = '';
  String postDetail = '';
  String bgVideo = '';
  String personName = '';
  String personLogo = '';
  String personDesc = '';
  String companyAlias = '';
  String companyLogo = '';
  String tags = '';
  int subScribeNum = 0;
  List<Industry> industryList = [];
  List<InfoItem> infoItems = [];

  late Post post;

  bool isCollect = false;
  int subcribeBtnType = 1;

  bool isInitAnimition = false;
  final FijkPlayer player = FijkPlayer();
  final double playerBoxWidth = 260;
  ShowConfigAbs vSkinCfg = PlayerShowConfig();

  int currentPage = 1;
  int loadStatus = 0;
  bool hasMore = true;
  List<Post> data = [];
  List<String> machineUsers = [];
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
    Wakelock.enable();
    Map<String, String> params = Get.arguments;
    debugPrint('params=' + params.toString());
    postId = params['id'];
    loadPost();
    loadCollectInfo();
    isInitAnimition = true;
  }

  @override
  void onReady() {
    super.onReady();
    refreshData();
    loadInfoItem();
  }

  @override
  void onClose() async {
    Wakelock.disable();
    stopPlater();
    player.release();
  }

  stopPlater() async {
    if (FijkState.started == player.state) {
      await player.stop();
    }
  }

  pausePlater() async {
    if (FijkState.started == player.state) {
      await player.pause();
    }
  }

  startPlater() async {
    if (FijkState.stopped == player.state || FijkState.paused == player.state) {
      await player.start();
    }
  }

  tapSubscribe() {
    pausePlater();
    if (UserService.to.isLogin.value) {
      subscribe();
    } else {
      Get.toNamed(Routes.JOB_LOGIN);
    }
  }

  tapCollect() {
    if (UserService.to.isLogin.value) {
      saveCollect();
    } else {
      Get.toNamed(Routes.JOB_LOGIN);
    }
  }

  tapFeedback() {
    pausePlater();
    Get.toNamed(Routes.JOB_FEEDBACK);
  }

  loadPost() {
    JobApi.to.getPostInfo(int.parse(postId!), success: ((data) {
      debugPrint('result=' + data.toJson().toString());
      post = data;
      title = data.title;
      postDetail = data.postDetail;
      bgVideo = data.bgVedio;
      personName = data.personName;
      personLogo = data.personLogo;
      personDesc = data.personDescp;
      companyAlias = data.alias;
      companyLogo = data.logo;
      tags = data.tags;
      subScribeNum = data.subscribeNum.toInt();
      if (data.industry.isNotEmpty) {
        loadPostIndustry(data.industry);
      }
      // postListId = data.postListDetail
      loadSubcribeType();
      loadMachineUsers();
      update();
      // 设置播放源
      player.setDataSource(bgVideo, autoPlay: true);
      UserService.to.saveBrowseHistory(data);
    }));
  }

  loadCollectInfo() {
    JobApi.to.getCollectInfo(
      postId!,
      success: (data) {
        isCollect = data;
      },
    );
  }

  loadPostIndustry(String name) {
    JobApi.to.getPostIndustry(
      name,
      success: (data) {
        industryList = data;
        update();
      },
    );
  }

  loadInfoItem() {
    JobApi.to.getBasicInfoConfig(
      success: (data) {
        infoItems = (data as List<dynamic>)
            .map((e) => InfoItem.fromJson(e as Map<String, dynamic>))
            .toList();
        update();
      },
    );
  }

  subscribe() {
    JobApi.to.saveSubscribe(
      int.parse(postId!),
      success: (data) {
        loadPost();
        // 打开小程序
        ToastUtil.show('打开小程序');
        data['miniWechat'];
        // 复制微信号打开微信
        data['mobile'];
        data['wechat'];
      },
    );
  }

  loadSubcribeType() {
    if (post.subscribeStatus == -1) {
      if (post.status == 3) {
        // 可报名
        subcribeBtnType = 1;
      } else if (post.status == 4) {
        // 名额已满，今日报名额度以用完，明日再来
        subcribeBtnType = 3;
      } else {
        // 名额已满，岗位已下线
        subcribeBtnType = 4;
      }
    } else {
      // 已报名
      subcribeBtnType = 2;
    }
    update();
  }

  loadMachineUsers() {
    JobApi.to.getMachineUser(int.parse(postId!), success: ((data) {
      for (var item in data) {
        machineUsers.add(item['headUrl']);
      }
      update();
    }));
  }

  saveCollect() {
    JobApi.to.saveCollect(int.parse(postId!), !isCollect, success: (data) {
      isCollect = !isCollect;
      update();
      if (isCollect) {
        ToastUtil.show('收藏成功');
      } else {
        ToastUtil.show('取消收藏成功');
      }
    });
  }

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
    Pagination<Post> result =
        await JobApi.to.getPostRecommendPage('10002', currentPage);
    if (result.pageNum < result.pages) {
      hasMore = true;
    } else {
      hasMore = false;
    }
    return result.data;
  }
}

class PlayerShowConfig implements ShowConfigAbs {
  @override
  bool speedBtn = true;
  @override
  bool topBar = true;
  @override
  bool lockBtn = true;
  @override
  bool bottomPro = true;
  @override
  bool stateAuto = true;
}
