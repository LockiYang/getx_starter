import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/styles/zstyle.dart';
import '../../../common/styles/zstyle_constants.dart';
import '../../../common/widgets/button/zbutton_sm.dart';

class CourseMessageItem extends StatelessWidget {
  const CourseMessageItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(ZStyleConstans.hSpacingSm,
          ZStyleConstans.hSpacingSm, ZStyleConstans.hSpacingSm, 0),
      padding: EdgeInsets.all(ZStyleConstans.hSpacingSm),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ZStyleConstans.radiusLg),
          color: Colors.white),
      // color: Colors.white,
      // color: e,
      child: Column(children: [
        Container(
          margin: EdgeInsets.only(bottom: ZStyleConstans.hSpacingSm),
          child: Row(
            children: [
              Container(
                child: Stack(children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(ZStyleConstans.radiusSm),
                    child: Image.asset(
                      'assets/images/course.jpeg',
                      height: 80.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                        decoration: BoxDecoration(
                            color: Colors.green[400],
                            borderRadius: BorderRadius.only(
                                topLeft:
                                    Radius.circular(ZStyleConstans.radiusSm),
                                bottomRight:
                                    Radius.circular(ZStyleConstans.radiusSm))),
                        child: Text(
                          '已报名',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ))
                ]),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(left: ZStyleConstans.hSpacingXs),
                width: double.infinity,
                height: 80.w,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '零基础招PS学徒 在家做单赚钱，无需垫付',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: ZStyle.textSubHead,
                      ),
                      Wrap(
                        // alignment: WrapAlignment.end,
                        spacing: ZStyleConstans.hSpacingXs,
                        runSpacing: ZStyleConstans.hSpacingXs,
                        children: [
                          BrnStateTag(
                            tagText: '非常好',
                            tagState: TagState.succeed,
                          ),
                          BrnStateTag(
                            tagText: '前景高',
                            tagState: TagState.failed,
                          ),
                          BrnStateTag(
                            tagText: '轻松在家',
                            tagState: TagState.running,
                          ),
                        ],
                      ),
                    ]),
              ))
            ],
          ),
        ),
        Dividerz.divider1,
        Container(
            padding: EdgeInsets.only(top: ZStyleConstans.hSpacingSm),
            // alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '2022-04-01 12:00',
                  style: ZStyle.textCaption,
                ),
                ZbuttonSm(text: '查看详情', color: Colors.brown,)
              ],
            )),
      ]),
    );
  }
}
