import 'package:bruno/bruno.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/styles/zstyle.dart';
import '../../../common/styles/zstyle_constants.dart';
import '../../../common/widgets/button/zbutton_sm.dart';
import '../data/models/post.dart';

class CourseMessageItem extends StatelessWidget {
  const CourseMessageItem({
    required this.post,
    this.showBottom = true,
    Key? key,
  }) : super(key: key);

  final Post post;
  final bool showBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(ZStyleConstans.hSpacingSm,
          ZStyleConstans.hSpacingSm, ZStyleConstans.hSpacingSm, 0),
      padding: EdgeInsets.fromLTRB(ZStyleConstans.hSpacingSm,
          ZStyleConstans.hSpacingSm, ZStyleConstans.hSpacingSm, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ZStyleConstans.radiusLg),
          color: Colors.white),
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
                      child: CachedNetworkImage(
                          imageUrl: post.bgImg,
                          height: 80.w,
                          fit: BoxFit.contain)),
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
                        post.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: ZStyle.textSubHead,
                      ),
                      Wrap(
                        // alignment: WrapAlignment.end,
                        spacing: ZStyleConstans.hSpacingXs,
                        runSpacing: ZStyleConstans.hSpacingXs,
                        children: _buildTags(),
                      ),
                    ]),
              ))
            ],
          ),
        ),
        showBottom ? Dividerz.dividerH1 : Container(),
        showBottom
            ? Container(
                padding:
                    EdgeInsets.symmetric(vertical: ZStyleConstans.hSpacingSm),
                // alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '报名时间：' + post.scribeCreateAt,
                      style: ZStyle.textCaption,
                    ),
                    ZbuttonSm(
                      text: '查看报名详情',
                      color: Colors.brown,
                    )
                  ],
                ))
            : Container(),
      ]),
    );
  }

  List<Widget> _buildTags() {
    if (post.tags.isNotEmpty) {
      List<String> tagList = post.tags.split(',');
      if (tagList.isNotEmpty) {
        return List.generate(
            tagList.length,
            (index) => BrnStateTag(
                  tagText: tagList[index],
                  tagState: TagState.invalidate,
                ));
      }
    }
    return [];
  }
}
