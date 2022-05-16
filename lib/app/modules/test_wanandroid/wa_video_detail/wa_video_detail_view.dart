import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/widgets/fijkplayer/fijkplayer_skin.dart';
import 'wa_video_detail_controller.dart';

class WaVideoDetailView extends GetView<WaVideoDetailController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Container(
            //   height: MediaQuery.of(context).padding.top,
            //   color: Colors.black,
            // ),
            Container(
              height: controller.playerBoxWidth,
              // color: Colors.black,
              child: !controller.isInitAnimition
                  ? Container(
                      height: controller.playerBoxWidth,
                      color: Colors.black,
                    )
                  : FijkView(
                      height: controller.playerBoxWidth,
                      color: Colors.black,
                      fit: FijkFit.cover,
                      player: controller.player,
                      panelBuilder: (
                        FijkPlayer player,
                        FijkData data,
                        BuildContext context,
                        Size viewSize,
                        Rect texturePos,
                      ) {
                        /// 使用自定义的布局
                        return CustomFijkPanel(
                          player: player,
                          viewSize: viewSize,
                          texturePos: texturePos,
                          pageContent: context,
                          playerTitle: controller.title ?? "暂无",
                          showConfig: controller.vSkinCfg,
                          curPlayUrl: controller.curPlayUrl ?? "",
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
