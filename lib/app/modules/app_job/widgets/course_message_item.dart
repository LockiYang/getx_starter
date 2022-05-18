import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/styles/stylez.dart';
import '../../../common/styles/theme_constants.dart';
import '../../../common/widgets/button/zbutton_sm.dart';

class CourseMessageItem extends StatelessWidget {
  const CourseMessageItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(ThemeConstants.hSpacingSm,
          ThemeConstants.hSpacingSm, ThemeConstants.hSpacingSm, 0),
      padding: EdgeInsets.all(ThemeConstants.hSpacingSm),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ThemeConstants.radiusLg),
          color: Colors.white),
      // color: Colors.white,
      // color: e,
      child: Column(children: [
        Container(
          margin: EdgeInsets.only(bottom: ThemeConstants.hSpacingSm),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(ThemeConstants.radiusSm),
                child: Image.asset(
                  'assets/images/course.jpeg',
                  height: 80.w,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(left: ThemeConstants.hSpacingXs),
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
                        style: Stylez.textSubHead,
                      ),
                      Wrap(
                        // alignment: WrapAlignment.end,
                        spacing: ThemeConstants.hSpacingXs,
                        runSpacing: ThemeConstants.hSpacingXs,
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
        Dividerz.divider1Half,
        Container(
            padding: EdgeInsets.only(top: ThemeConstants.hSpacingSm),
            // alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '2022-04-01 12:00',
                  style: Stylez.textCaption,
                ),
                ZbuttonSm(text: '查看详情', color: Colors.brown,)
              ],
            )),
      ]),
    );
  }
}
