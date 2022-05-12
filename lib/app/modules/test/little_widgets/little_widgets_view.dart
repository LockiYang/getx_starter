import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/common/no_splash_factory.dart';
import 'package:getx_test/app/utils/toast_util.dart';

import 'little_widgets_controller.dart';

class LittleWidgetsView extends GetView<LittleWidgetsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LittleWidgetsView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(title: Text('Toast'), onTap: () => ToastUtil.show('这是测试')),
          ElevatedButton(
            onPressed: () => {},
            child: Text('Elevated button'),
            style: ButtonStyle(splashFactory: NoSplashFactory()),
          ),
          TextButton(onPressed: () => {}, child: Text('Text button')),
          OutlinedButton(onPressed: () => {}, child: Text('Outlined button')),
          Row(
            children: [
              Container(
                child: Text('+86', style: TextStyle(fontSize: 12,height: 1)),
                decoration: BoxDecoration(border: Border.all()),
              ),
              Container(
                child: Text('我是中文', style: TextStyle(fontSize: 20,height: 1)),
                decoration: BoxDecoration(border: Border.all()),
              )
            ],
          ),
          Row(
            children: [
              Container(
                child: Text('+86', style: TextStyle(fontSize: 12), strutStyle: StrutStyle(forceStrutHeight:true, leading: 0.4 )),
                decoration: BoxDecoration(border: Border.all()),
              ),
              Container(
                child: Text('我是中文', style: TextStyle(fontSize: 20), strutStyle: StrutStyle(forceStrutHeight:true, leading: 0.4 ),),
                decoration: BoxDecoration(border: Border.all()),
              )
            ],
          ),
          Row(
            children: [
              // Container(
              //   child: Text('+86'),
              //   decoration: BoxDecoration(border: Border.all()),
              // ),
              Text('+86', style: TextStyle(height: 1)),
              Text('我是中文', style: TextStyle(fontSize: 20, height: 1)),
              // Container(
              //   child: Text('我是中文', style: TextStyle(fontSize: 20)),
              //   decoration: BoxDecoration(border: Border.all()),
              // )
            ],
          ),
          Row(
            children: [
              // Container(
              //   child: Text('+86'),
              //   decoration: BoxDecoration(border: Border.all()),
              // ),
              Text('+86', style: TextStyle(height: 1)),
              Text('我是中文', style: TextStyle(fontSize: 20, height: 1)),
              // Container(
              //   child: Text('我是中文', style: TextStyle(fontSize: 20)),
              //   decoration: BoxDecoration(border: Border.all()),
              // )
            ],
          )
        ],
      ),
    );
  }
}
