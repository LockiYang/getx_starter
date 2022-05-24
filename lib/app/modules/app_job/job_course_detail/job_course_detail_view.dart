import 'package:bruno/bruno.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';

import 'package:getx_test/app/common/getx/getz_view.dart';
import 'package:getx_test/app/common/styles/zstyle.dart';
import 'package:getx_test/app/common/styles/zstyle_constants.dart';
import 'package:getx_test/app/common/utils/toast_util.dart';
import 'package:getx_test/app/common/widgets/button/basic_button.dart';

import '../../../common/utils/multi_click_util.dart';
import '../../../common/widgets/fijkplayer/fijkplayer_skin.dart';
import '../../../common/widgets/paging_refresher.dart';
import '../../test/custom_icon/widgets/antd_icons.dart';
import '../widgets/course_message_item.dart';
import 'job_course_detail_controller.dart';

class JobCourseDetailView extends GetzView<JobCourseDetailController> {
  const JobCourseDetailView({Key? key, String? tag})
      : super(key: key, tag: tag);
  @override
  Widget build(BuildContext context) {
    final double bottomHeight = MediaQuery.of(context).padding.bottom;
    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildPlayer(),
                    _buildHeader(),
                    _buildCourseInfo(),
                    _buildCompany(),
                    _buildRecommend(),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 6, 20, bottomHeight),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => MultiClickUtil.debounce(
                        () => {controller.saveCollect()}),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: EdgeInsets.only(right: 10),
                      child: Column(children: [
                        controller.isCollect
                            ? Icon(Icons.star)
                            : Icon(Icons.star_border),
                        Text(
                          '收藏',
                          style: ZStyle.textCaption,
                        )
                      ]),
                    ),
                  ),
                  Expanded(
                    child: BasicButtom(
                      text: '免费报名',
                      alignment: Alignment.center,
                      onTap: () {
                        ToastUtil.show('message');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildRecommend() {
    return Container(
        alignment: Alignment.topLeft,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: ZStyleConstans.vSpacingMd),
        padding: EdgeInsets.all(ZStyleConstans.vSpacingMd),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Text(
              '大家都在看',
              style: ZStyle.textSubHead,
            ),
            // Expanded(
            //     child: PagingRefreshWidget<JobCourseDetailController>(
            //         child: ListView.builder(
            //             padding: EdgeInsets.zero,
            //             shrinkWrap: true,
            //             itemCount: controller.data.length,
            //             itemBuilder: (context, index) {
            //               return CourseMessageItem(
            //                   post: controller.data[index]);
            //             })))
          ],
        ));
  }

  Container _buildCompany() {
    return Container(
        alignment: Alignment.topLeft,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: ZStyleConstans.vSpacingMd),
        padding: EdgeInsets.all(ZStyleConstans.vSpacingMd),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '讲师介绍',
              style: ZStyle.textSubHead,
            ),
            Spacez.vSpacezSm,
            Container(
              alignment: Alignment.topLeft,
              width: double.infinity,
              padding: EdgeInsets.all(ZStyleConstans.vSpacingMd),
              decoration: BoxDecoration(
                  color: ZStyleConstans.fillBody,
                  borderRadius: BorderRadius.circular(ZStyleConstans.radiusMd)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            controller.personName,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          BrnStateTag(
                            tagText: '金牌讲师',
                            tagState: TagState.waiting,
                          ),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: controller.personLogo.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl: controller.personLogo,
                                width: 40,
                                height: 40,
                                fit: BoxFit.fill,
                              )
                            : Container(),
                      )
                    ],
                  ),
                  Spacez.vSpacezXs,
                  Dividerz.dividerH1,
                  Spacez.vSpacezXs,
                  Text(
                    controller.personDesc,
                    style: ZStyle.textBase,
                  )
                ],
              ),
            ),
            Spacez.vSpacezMd,
            Text(
              '授课机构',
              style: ZStyle.textSubHead,
            ),
            Spacez.vSpacezSm,
            Container(
              alignment: Alignment.topLeft,
              width: double.infinity,
              padding: EdgeInsets.all(ZStyleConstans.vSpacingMd),
              decoration: BoxDecoration(
                  color: ZStyleConstans.fillBody,
                  borderRadius: BorderRadius.circular(ZStyleConstans.radiusMd)),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(right: ZStyleConstans.vSpacingMd),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: Icon(
                      AntdIcons.home,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.companyAlias,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '企业认证',
                        style: ZStyle.textCaption,
                      )
                    ],
                  )),
                  Icon(
                    AntdIcons.right,
                    size: 16,
                    color: ZStyleConstans.colorTextHint,
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Container _buildCourseInfo() {
    return Container(
        alignment: Alignment.topLeft,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: ZStyleConstans.vSpacingMd),
        padding: EdgeInsets.all(ZStyleConstans.vSpacingMd),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '课程介绍',
              style: ZStyle.textSubHead,
            ),
            Spacez.vSpacezSm,
            Text(
              controller.postDetail,
              style: ZStyle.textBase,
            ),
          ],
        ));
  }

  Container _buildHeader() {
    return Container(
      alignment: Alignment.topLeft,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: ZStyleConstans.vSpacingMd),
      padding: EdgeInsets.all(ZStyleConstans.vSpacingMd),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          controller.title,
          style: ZStyle.textHead,
        ),
        SizedBox(
          height: 4,
        ),
        Wrap(
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
        Spacez.vSpacezSm,
        Dividerz.dividerH1,
        Container(
          alignment: Alignment.topLeft,
          width: double.infinity,
          margin: EdgeInsets.only(top: ZStyleConstans.vSpacingMd),
          padding: EdgeInsets.symmetric(
              vertical: ZStyleConstans.vSpacingSm,
              horizontal: ZStyleConstans.hSpacingMd),
          decoration: BoxDecoration(
              color: Colors.blueGrey[50],
              borderRadius: BorderRadius.circular(ZStyleConstans.radiusMd)),
          child: Row(
            children: [
              Icon(
                AntdIcons.fileCopyFill,
                size: 24,
                color: Colors.blueGrey,
              ),
              Spacez.hSpacezSm,
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '免费领取资料',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '100G PS设计学习包',
                    style: ZStyle.textCaption,
                  )
                ],
              )),
              Icon(
                AntdIcons.right,
                size: 16,
                color: ZStyleConstans.colorTextHint,
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          width: double.infinity,
          margin: EdgeInsets.only(top: ZStyleConstans.vSpacingMd),
          padding: EdgeInsets.symmetric(
              vertical: ZStyleConstans.vSpacingSm,
              horizontal: ZStyleConstans.hSpacingMd),
          decoration: BoxDecoration(
              color: Colors.blueGrey[50],
              borderRadius: BorderRadius.circular(ZStyleConstans.radiusMd)),
          child: Row(
            children: [
              Icon(
                AntdIcons.wechatFill,
                size: 24,
                color: Colors.blueGrey,
              ),
              Spacez.hSpacezSm,
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '兼职接单群',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '学成可做兼职，收入可达800/天',
                    style: ZStyle.textCaption,
                  )
                ],
              )),
              Icon(
                AntdIcons.right,
                size: 16,
                color: ZStyleConstans.colorTextHint,
              ),
            ],
          ),
        ),
        // Row(
        //   children: [
        //     AvatarStack(
        //       num: 20,
        //       size: 16,
        //       offset: 10,
        //     ),
        //     Text(
        //       '已有30123人报名',
        //       style: ZStyle.textCaption,
        //     )
        //   ],
        // ),
      ]),
    );
  }

  Container _buildPlayer() {
    return Container(
      height: controller.playerBoxWidth,
      // color: Colors.black,
      child: !controller.isInitAnimition
          ? Container(
              height: controller.playerBoxWidth,
              color: Colors.black,
            )
          : FijkView(
              height: controller.playerBoxWidth,
              color: Colors.black,
              fit: FijkFit.cover,
              player: controller.player,
              panelBuilder: (
                FijkPlayer player,
                FijkData data,
                BuildContext context,
                Size viewSize,
                Rect texturePos,
              ) {
                /// 使用自定义的布局
                return CustomFijkPanel(
                  player: player,
                  viewSize: viewSize,
                  texturePos: texturePos,
                  pageContent: context,
                  showConfig: controller.vSkinCfg,
                  curPlayUrl: '',
                );
              },
            ),
    );
  }
}
