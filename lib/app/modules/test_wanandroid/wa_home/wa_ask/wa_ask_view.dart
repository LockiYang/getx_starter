import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'wa_ask_controller.dart';

class WaAskView extends GetView<WaAskController> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          'WaAskView is working',
          style: TextStyle(fontSize: 20),
        ),
      );
  }
}
