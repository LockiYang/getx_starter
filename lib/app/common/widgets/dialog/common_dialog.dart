import 'package:flutter/material.dart';
import 'package:getx_test/app/common/styles/theme_constants.dart';
import 'package:getx_test/app/common/utils/dialog_util.dart';

import '../../styles/stylez.dart';
import '../over_scroll_behavior.dart';

/// 公共加载弹窗
class CommonDialog extends StatelessWidget {
  ///标题
  final String title;

  ///内容
  final String content;

  ///左侧文字
  final String backText;

  ///右侧文字
  final String nextText;

  ///左侧事件
  final VoidCallback? backTap;

  ///右侧事件
  final VoidCallback? nextTap;

  ///左侧是否隐藏
  final bool backVisible;

  ///右侧是否隐藏
  final bool nextVisible;

  CommonDialog({
    Key? key,
    this.title = '',
    this.content = '',
    this.backText = '',
    this.nextText = '',
    this.backVisible = true,
    this.nextVisible = true,
    this.backTap,
    this.nextTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(

        ///透明样式
        type: MaterialType.transparency,

        ///dialog居中
        child: Center(

            ///取消ListView滑动阴影
            child: ScrollConfiguration(
                behavior: OverScrollBehavior(),

                ///ListView 的shrinkWrap属性可适应高度（有多少占多少）
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ///背景及内容、边距、圆角等，必须包裹在ListView中
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ///标题、内容
                            Spacez.vSpacezSm,
                            Text(
                              title,
                              style: Stylez.textHead,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              child: Text(
                                content,
                                style: Stylez.textSubHead,
                              ),
                            ),
                            Dividerz.divider1Half,

                            ///确定、取消按钮
                            Flex(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              direction: Axis.horizontal,
                              children: [
                                ///对半分
                                _buildTextButton(
                                    backTap, backText, backVisible),
                                _buildTextButton(nextTap, nextText, nextVisible)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ))));
  }

  ///此处使用方法重新创建的原因是因为此处不需要频繁更新，不会造成过度创建
  _buildTextButton(VoidCallback? tap, String text, bool show) {
    return Visibility(
        visible: show,
        child: Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                DialogUtil.dismiss();
                if (tap != null) {
                  tap();
                }
              },
              style: ButtonStyle(
                shadowColor:
                    MaterialStateProperty.all(ThemeConstants.borderColorBase),
                animationDuration: const Duration(milliseconds: 200),
                padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
              ),
              child: Container(
                alignment: Alignment.center,
                height: 60,
                child: Text(
                  text,
                  style: Stylez.textSubHead,
                ),
              ),
            )));
  }
}
