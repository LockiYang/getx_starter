import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../common/getx/getz_view.dart';
import 'webview_controller.dart';

class WebviewView extends GetzView<WebviewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BrnAppBar(
        // backLeadCallback: () => {},
        title: controller.model.title,
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: controller.model.link,
            javascriptMode: JavascriptMode.unrestricted,
            onProgress: (pro) {
              controller
                ..progress = (pro / 100).toDouble()
                ..update();
            },
          ),
          Visibility(
            visible: controller.progress < 1,
            child: LinearProgressIndicator(
              minHeight: 2,
              backgroundColor: Color(0xFFF9F9F9),
              color: Color(0xFF24CF5F),
              value: controller.progress,
            ),
          )
        ],
      ),
    );
  }
}
