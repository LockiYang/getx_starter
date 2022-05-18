import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/styles/stylez.dart';
import '../../../common/styles/theme_constants.dart';
import '../../../common/widgets/button/zbutton_sm.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({
    this.showAction = true,
    this.showBottom = true,
    Key? key,
  }) : super(key: key);

  final bool showAction;
  final bool showBottom;

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
                  height: 100.w,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(left: ThemeConstants.hSpacingXs),
                width: double.infinity,
                height: 100.w,
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
                      Visibility(
                          visible: showAction,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '900人报名',
                                style: Stylez.textCaption,
                              ),
                              ZbuttonSm(text: '免费报名',)
                            ],
                          )),
                    ]),
              ))
            ],
          ),
        ),
        Dividerz.divider1Half,
        Visibility(
          visible: showBottom,
          child: Container(
              padding: EdgeInsets.only(top: ThemeConstants.hSpacingSm),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text('学完可做兼职，收入可达'),
                  Text(
                    '7000元/月',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )),
        ),
      ]),
    );
  }
}
