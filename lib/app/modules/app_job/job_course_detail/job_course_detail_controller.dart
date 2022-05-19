import 'package:fijkplayer/fijkplayer.dart';
import 'package:get/get.dart';
import 'package:wakelock/wakelock.dart';

import '../../../common/widgets/fijkplayer/fijkplayer_skin.dart';

class JobCourseDetailController extends GetxController {

  //
  bool isInitAnimition = false;
  //
  String? curPlayUrl = 'http://baobab.kaiyanapp.com/api/v1/playUrl?vid=308840&resourceType=video&editionType=default&source=aliyun&playUrlType=url_oss&udid=';
  //
  final FijkPlayer player = FijkPlayer();
  final double playerBoxWidth = 260;
  ShowConfigAbs vSkinCfg = PlayerShowConfig();
  
    @override
  void onInit() {
    super.onInit();
    // 设置播放源
    player.setDataSource(curPlayUrl ?? "", autoPlay: false);
    isInitAnimition = true;
    Wakelock.enable();
  }

  @override
  void onClose() async {
    Wakelock.disable();
    // await player.stop();
    player.release();
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
