import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'wa_feedback_controller.dart';

class WaFeedbackView extends GetView<WaFeedbackController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WaFeedbackView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'WaFeedbackView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
