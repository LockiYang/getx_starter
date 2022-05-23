import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/common/utils/dialog_util.dart';

import '../../../common/styles/zstyle.dart';
import '../../../common/widgets/button/basic_button.dart';
import '../../../common/widgets/button/basic_switch_button.dart';
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
          BrnSwitchButton(
                  size: Size(42,25),
                  value: true,
                  enabled:true,
                  onChanged: (bool value) {
                  },
                ),
          BasicSwitchButton(
            size: Size(40, 20),
            onChanged: (value) => {},
            value: true,
            enabled: true,
          ),
          BasicButtom(
              text: '我测试',
              constraints: BoxConstraints.expand(height: 40, width: 200)),
          BasicButtom.outline(
            text: '我测试',
            borderWith: 1,
            // constraints: BoxConstraints.expand(height: 40, width: 200)
          ),
          Spacez.vSpacezLg,
          BrnBigGhostButton(
            title: 'Toast',
            onTap: () => {
              Get.bottomSheet(
                  Container(
                    height: 100,
                    child: Text('xxx'),
                  ),
                  backgroundColor: Colors.white)
            },
          ),
          BrnSmallMainButton(
            title: 'Loadding',
            onTap: () => {DialogUtil.showLoading(text: '加载中')},
          ),
          BrnSmallMainButton(
            title: 'common dialog',
            onTap: () =>
                {DialogUtil.commonDialog(title: '普通弹窗', content: '加载中')},
          ),
          BrnSmallMainButton(
            title: 'brn dialog',
            onTap: () => {
              Get.dialog(BrnDialog(
                titleText: '标题内容',
                messageText: '文本内容文本内容文本内容文本内容',
              ))
            },
          ),
          TextButton(onPressed: () => {}, child: Text('Text button')),
          OutlinedButton(onPressed: () => {}, child: Text('Outlined button')),
          Row(
            children: [
              Container(
                child: Text('+86', style: TextStyle(fontSize: 12, height: 1)),
                decoration: BoxDecoration(border: Border.all()),
              ),
              Container(
                child: Text('我是中文', style: TextStyle(fontSize: 20, height: 1)),
                decoration: BoxDecoration(border: Border.all()),
              )
            ],
          ),
          Row(
            children: [
              Container(
                child: Text('+86',
                    style: TextStyle(fontSize: 12),
                    strutStyle:
                        StrutStyle(forceStrutHeight: true, leading: 0.4)),
                decoration: BoxDecoration(border: Border.all()),
              ),
              Container(
                child: Text(
                  '我是中文',
                  style: TextStyle(fontSize: 20),
                  strutStyle: StrutStyle(forceStrutHeight: true, leading: 0.4),
                ),
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
