import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// 加载中弹窗
class LoadingDialog extends StatelessWidget {
  final String text;

  LoadingDialog({
    Key? key,
    this.text = '加载中',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        //创建透明层
        type: MaterialType.transparency, //透明类型
        child: Center(
          //保证控件居中效果
          child: SizedBox(
            width: 100,
            height: 100,
            child: Container(
              decoration: const ShapeDecoration(
                color: Colors.black45,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Lottie.asset('assets/lotties/lottie_common_load.json',
                        width: 50, animate: true),
                  ),
                  Text(text,
                      style: TextStyle(color: Colors.white, fontSize: 14))
                ],
              ),
            ),
          ),
        ));
  }
}
