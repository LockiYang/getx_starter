import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'sliver_widgets_controller.dart';

class SliverWidgetsView extends GetView<SliverWidgetsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliver系列组件'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: controller.demos.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: ElevatedButton(
                  child: Text(controller.demos[index].title),
                  onPressed: () => {
                    Get.to(controller.demos[index].demo)
                  },
                ));
          }),
    );
  }
}
