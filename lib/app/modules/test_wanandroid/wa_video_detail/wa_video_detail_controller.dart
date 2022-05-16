import 'package:fijkplayer/fijkplayer.dart';
import 'package:get/get.dart';
import 'package:wakelock/wakelock.dart';

import '../../../common/widgets/fijkplayer/fijkplayer_skin.dart';

class WaVideoDetailController extends GetxController {
  //
  bool isInitAnimition = false;
  //
  String? curPlayUrl = Get.parameters["playUrl"];
  String? videoId = Get.parameters["id"];
  String? title = Get.parameters["title"];
  String? typeName = Get.parameters["typeName"];
  String? desText = Get.parameters["desText"];
  String? subTime = Get.parameters["subTime"];
  String? avatarUrl = Get.parameters["avatarUrl"];
  String? authorDes = Get.parameters["authorDes"];
  String? authorName = Get.parameters["authorName"];
  String? videoPoster = Get.parameters["videoPoster"];
  bool isNotAuthor = Get.parameters["avatarUrl"] == null ? true : false;
  //
  final double playerBoxWidth = 260;

  final FijkPlayer player = FijkPlayer();
  ShowConfigAbs vSkinCfg = PlayerShowConfig();

  @override
  void onInit() {
    super.onInit();
    // 设置播放源
    player.setDataSource(curPlayUrl ?? "", autoPlay: true);
    isInitAnimition = true;
    Wakelock.enable();
  }

  @override
  void onClose() async {
    Wakelock.disable();
    await player.stop();
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
