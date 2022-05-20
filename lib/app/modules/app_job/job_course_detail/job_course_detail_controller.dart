import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/modules/app_job/data/repositorys/job_api.dart';
import 'package:wakelock/wakelock.dart';

import '../../../common/widgets/fijkplayer/fijkplayer_skin.dart';

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

  //
  bool isInitAnimition = false;
  //
  String? curPlayUrl =
      'http://baobab.kaiyanapp.com/api/v1/playUrl?vid=308840&resourceType=video&editionType=default&source=aliyun&playUrlType=url_oss&udid=';
  //
  final FijkPlayer player = FijkPlayer();
  final double playerBoxWidth = 260;
  ShowConfigAbs vSkinCfg = PlayerShowConfig();
  late JobApi jobApi;

  @override
  void onInit() {
    super.onInit();
    Wakelock.enable();
    Map<String, String> params = Get.arguments;
    debugPrint('params=' + params.toString());
    postId = params['id'];
    jobApi = Get.find<JobApi>();
    bgVideo = 'https://wyjob.oss-cn-beijing.aliyuncs.com/bgvideo/ps.mp4';
    loadingData();
    isInitAnimition = true;
  }

  @override
  void onClose() async {
    Wakelock.disable();
    // await player.stop();
    player.release();
  }

  loadingData() {
    jobApi.getPostInfo(int.parse(postId!), success: ((data) {
      debugPrint('result=' + data.toJson().toString());
      title = data.title;
      postDetail = data.postDetail;
      bgVideo = data.bgVedio ?? '';
      personName = data.personName;
      personLogo = data.personLogo;
      personDesc = data.personDescp;
      companyAlias = data.alias;
      companyLogo = data.logo;

      update();
      // 设置播放源
      player.setDataSource(bgVideo, autoPlay: true);
    }));
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
