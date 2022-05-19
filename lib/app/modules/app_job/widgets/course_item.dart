import 'package:bruno/bruno.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/styles/stylez.dart';
import '../../../common/styles/theme_constants.dart';
import '../../../common/widgets/button/zbutton_sm.dart';
import '../data/models/post.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({
    required this.post,
    Key? key,
  }) : super(key: key);

  final Post post;

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
              _buildImg(),
              Expanded(
                  child: Container(
                width: double.infinity,
                height: 90.w,
                margin: EdgeInsets.only(left: ThemeConstants.hSpacingXs),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.title,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${post.subScribeNum}人报名',
                            style: Stylez.textCaption,
                          ),
                          ZbuttonSm(
                            text: '免费报名',
                          )
                        ],
                      ),
                    ]),
              ))
            ],
          ),
        ),
        Dividerz.divider1,
        _buildBottom(),
      ]),
    );
  }

  Container _buildBottom() {
    return Container(
        padding: EdgeInsets.only(top: ThemeConstants.hSpacingSm),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Text('学完可做兼职，收入可达'),
            Text(
              '7000元/月',
              style: TextStyle(
                  color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }

  Container _buildImg() {
    return Container(
      child: Stack(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(ThemeConstants.radiusSm),
            child: CachedNetworkImage(
                imageUrl: post.bgImg,
                height: 90.w,
                width: 120.w,
                fit: BoxFit.fill)),
        Positioned(
            left: 0,
            top: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(ThemeConstants.radiusSm),
                      bottomRight: Radius.circular(ThemeConstants.radiusSm))),
              child: Text(
                '视频',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ))
      ]),
    );
  }
}
