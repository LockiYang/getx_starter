import 'package:bruno/bruno.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/modules/app_job/job_course_detail/job_course_detail_binding.dart';
import 'package:getx_test/app/modules/app_job/job_course_detail/job_course_detail_view.dart';

import '../../../common/styles/zstyle.dart';
import '../../../common/styles/zstyle_constants.dart';
import '../../../common/widgets/button/zbutton_sm.dart';
import '../data/models/post.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({
    Key? key,
    this.showBottom = true,
    required this.post,
  }) : super(key: key);

  final Post post;
  final bool showBottom;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(JobCourseDetailView(tag: post.postId.toString()),
          arguments: {"id": post.postId.toString()},
          binding: JobCourseDetailBinding(tag: post.postId.toString())),
      child: Container(
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
                _buildImg(),
                Expanded(
                    child: Container(
                  width: double.infinity,
                  height: 90.w,
                  margin: EdgeInsets.only(left: ZStyleConstans.hSpacingXs),
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
                          children: [
                            BrnStateTag(
                              tagText: '非常好',
                              tagState: TagState.invalidate,
                            ),
                            BrnStateTag(
                              tagText: '前景高',
                              tagState: TagState.invalidate,
                            ),
                            BrnStateTag(
                              tagText: '轻松在家',
                              tagState: TagState.invalidate,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${post.subScribeNum}人报名',
                              style: ZStyle.textCaption,
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
          _buildBottom(),
        ]),
      ),
    );
  }

  Column _buildBottom() {
    return Column(
      children: [
        Dividerz.dividerH1,
        Container(
            padding: EdgeInsets.symmetric(vertical: ZStyleConstans.hSpacingSm),
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
      ],
    );
  }

  Container _buildImg() {
    return Container(
      child: Stack(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(ZStyleConstans.radiusSm),
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
                      topLeft: Radius.circular(ZStyleConstans.radiusSm),
                      bottomRight: Radius.circular(ZStyleConstans.radiusSm))),
              child: Text(
                '视频',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ))
      ]),
    );
  }
}
