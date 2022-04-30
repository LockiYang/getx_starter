import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'custom_icon_controller.dart';
import 'widgets/mock_data.dart';

class CustomIconView extends GetView<CustomIconController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义Icon'),
      ),
      body: GridView.builder(
        itemCount: iconList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        itemBuilder: (context, index) {
          return Center(
            child: Icon(
              iconList[index],
              size: 30,
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }

  Color makeRandomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
        .withOpacity(1.0);
  }
}
