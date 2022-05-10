import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'wa_square_controller.dart';

class WaSquareView extends GetView<WaSquareController> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          'WaSquareView is working',
          style: TextStyle(fontSize: 20),
        ),
      );
  }
}
