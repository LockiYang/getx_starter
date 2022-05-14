import 'package:flutter/material.dart';

class CommonDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final String? backText;
  final String? nextText;
  final bool? backVisible;
  final bool? nextVisible;

  final VoidCallback? backTap;
  final VoidCallback? nextTap;
  const CommonDialog(
      {Key? key,
      this.title,
      this.content,
      this.backText,
      this.nextText,
      this.backVisible = true,
      this.nextVisible = true,
      this.backTap,
      this.nextTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
          child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    title!,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Text(
                      content!,
                      style: TextStyle(color: Color(0xFF6A6969), fontSize: 16),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildTextButton(backTap, backText!, backVisible!),
                      _buildTextButton(nextTap, nextText!, nextVisible!),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  ///此处使用方法重新创建的原因是因为此处不需要频繁更新，不会造成过度创建
  _buildTextButton(VoidCallback? tap, String text, bool show) {
    return Visibility(
      visible: show,
      child: Expanded(
          child: TextButton(
        style: ButtonStyle(
          shadowColor: MaterialStateProperty.all(Color(0x66E0E6FD)),
          animationDuration: const Duration(milliseconds: 200),
          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
        ),
        onPressed: () {
          if (tap != null) {
            tap();
          }
        },
        child: Container(
          child: Text(text),
        ),
      )),
    );
  }
}
