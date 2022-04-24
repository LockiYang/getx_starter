import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  final String? text;
  const LoadingDialog({Key? key, this.text = '加载中'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      //创建透明层
      type: MaterialType.transparency,
      child: Center(
          child: SizedBox(
        width: 100,
        height: 100,
        child: Container(
          decoration: ShapeDecoration(
              color: Colors.black45,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)))),
          child: Column(children: [
            Text(text!)
          ]),
        ),
      )),
    );
  }
}
