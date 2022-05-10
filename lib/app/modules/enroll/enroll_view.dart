import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'enroll_controller.dart';

class EnrollView extends GetView<EnrollController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('我的报名')),
      body: Column(children: [
        TabBar(
            tabs: controller.myTabs,
            controller: controller.controller,
            labelColor: Colors.black),
        Expanded(
          child: TabBarView(
            controller: controller.controller,
            children: [
              for(final tab in controller.myTabs) 
                Center(child: Text(tab.text!),),
            ]
          ),
        )
      ]),
    );
  }
}
