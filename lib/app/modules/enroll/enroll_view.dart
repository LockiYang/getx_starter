import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/components/page_bar.dart';

import '../controllers/enroll_controller.dart';

class EnrollView extends GetView<EnrollController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        PageBarWidget(title: '我的报名'),
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
