import 'package:fijkplayer/fijkplayer.dart';
import 'package:get/get.dart';
import 'package:wakelock/wakelock.dart';

import '../../../common/widgets/fijkplayer/fijkplayer_skin.dart';
import '../../../services/video_history.dart';

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

  // 全局控制器
  HistoryService historyService = Get.put(HistoryService());

  @override
  void onInit() {
    super.onInit();
    // 加入历史记录
    historyService.add(
      id: videoId ?? "",
      playUrl: curPlayUrl ?? "",
      title: title ?? "",
      typeName: typeName ?? "",
      desText: desText ?? "",
      subTime: subTime ?? "",
      avatarUrl: avatarUrl ?? "",
      authorDes: authorDes ?? "",
      authorName: authorName ?? "",
      videoPoster: videoPoster ?? "",
    );
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
