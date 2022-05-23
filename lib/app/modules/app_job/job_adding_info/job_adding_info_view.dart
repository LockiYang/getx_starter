import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

import 'package:getx_test/app/common/getx/getz_view.dart';
import 'package:getx_test/app/common/styles/zstyle.dart';
import 'package:getx_test/app/common/styles/zstyle_constants.dart';
import 'package:getx_test/app/common/widgets/button/basic_button.dart';

import 'job_adding_info_controller.dart';

class JobAddingInfoView extends GetzView<JobAddingInfoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 30),
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
                          selectedTagTextStyle: TextStyle(
                              fontSize: 14, color: ZStyleConstans.brandPrimary),
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
          Spacez.vSpacezXxl,
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
