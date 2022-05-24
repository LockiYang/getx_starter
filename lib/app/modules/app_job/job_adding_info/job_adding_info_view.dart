import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

import 'package:getx_test/app/common/getx/getz_view.dart';
import 'package:getx_test/app/common/styles/zstyle.dart';
import 'package:getx_test/app/common/styles/zstyle_constants.dart';
import 'package:getx_test/app/common/widgets/button/basic_button.dart';

import '../widgets/shake_widget.dart';
import 'job_adding_info_controller.dart';

class JobAddingInfoView extends GetzView<JobAddingInfoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: controller.skip,
              child: Text(
                '跳过',
                style: TextStyle(color: ZStyleConstans.colorTextSecondary),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              '完善信息',
              style: ZStyle.textBebas,
            ),
          ),
          Column(
            children: List.generate(
              controller.infoItems.length,
              (index) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.infoItems[index].title,
                        style: ZStyle.textSubHead,
                      ),
                      Spacez.vSpacezLg,
                      BrnSelectTag(
                          tags: controller.infoItems[index].selDescs,
                          tagTextStyle: TextStyle(
                              fontSize: 14,
                              color: ZStyleConstans.colorTextBase),
                          tagBackgroundColor: Colors.grey[100],
                          selectedTagTextStyle: TextStyle(
                              fontSize: 14,
                              color: ZStyleConstans.brandPrimary,
                              fontWeight: FontWeight.normal),
                          selectedTagBackgroundColor:
                              ZStyleConstans.brandPrimary,
                          spacing: 16,
                          fixWidthMode: false,
                          onSelect: (selectedIndexes) {
                            controller
                              ..infoItems[index].selectIndex =
                                  selectedIndexes[0]
                              ..update();
                          }),
                      Spacez.vSpacezXl,
                    ]);
              },
            ),
          ),
          Spacez.vSpacezXl,
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 30,
            child: ShakeWidget(
              key: controller.shakeKey,
              child: Visibility(
                visible: controller.tipsVisible,
                child: Text(
                  '请完善以上信息哦～',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: BasicButtom(
              text: '确认',
              alignment: Alignment.center,
              constraints: BoxConstraints.expand(width: 100, height: 44),
              onTap: () => controller.submit(),
            ),
          )
        ]),
      )),
    );
  }
}
