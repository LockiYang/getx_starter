import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/common/utils/toast_util.dart';
import 'package:getx_test/app/modules/app_job/data/repositorys/job_api.dart';
import 'package:getx_test/app/modules/app_job/services/user_service.dart';
import 'package:wakelock/wakelock.dart';

import '../../../common/widgets/fijkplayer/fijkplayer_skin.dart';
import '../../../common/widgets/paging_controller.dart';
import '../data/models/pagination.dart';
import '../data/models/post.dart';

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

  String? postListId;
  bool isCollect = false;

  bool isInitAnimition = false;
  final FijkPlayer player = FijkPlayer();
  final double playerBoxWidth = 260;
  ShowConfigAbs vSkinCfg = PlayerShowConfig();

  @override
  void onInit() {
    super.onInit();
    Wakelock.enable();
    Map<String, String> params = Get.arguments;
    debugPrint('params=' + params.toString());
    postId = params['id'];
    getPost();
    getCollectInfo();
    isInitAnimition = true;
  }

  @override
  void onClose() async {
    Wakelock.disable();
    if (FijkState.started == player.state) {
      await player.stop();
    }
    player.release();
  }

  getPost() {
    JobApi.to.getPostInfo(int.parse(postId!), success: ((data) {
      debugPrint('result=' + data.toJson().toString());
      title = data.title;
      postDetail = data.postDetail;
      bgVideo = data.bgVedio;
      personName = data.personName;
      personLogo = data.personLogo;
      personDesc = data.personDescp;
      companyAlias = data.alias;
      companyLogo = data.logo;
      // postListId = data.postListDetail

      update();
      // 设置播放源
      player.setDataSource(bgVideo, autoPlay: true);
      // 保存历史记录
      UserService.to.saveBrowseHistory(data);
      // loadData();
    }));
  }

  getCollectInfo() {
    JobApi.to.getCollectInfo(
      postId!,
      success: (data) {
        isCollect = data;
      },
    );
  }

  saveCollect() {
    JobApi.to.saveCollect(int.parse(postId!), isCollect, success: (data) {
      isCollect = !isCollect;
      update();
      if (isCollect) {
        ToastUtil.show('收藏成功');
      } else {
        ToastUtil.show('取消收藏成功');
      }
    });
  }

  // @override
  // Future<List<Post>> loadData() async {
  //   Pagination<Post> result =
  //       await JobApi.to.getPostRecommendPage('27', currentPage);
  //   if (result.pageNum < result.pages) {
  //     hasMore = true;
  //   } else {
  //     hasMore = false;
  //   }
  //   return result.data;
  // }
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
