import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// @ProjectName:    plugin_base
/// @Package:        lib.common.global_store
/// @ClassName:      base_appbar
/// @Description:     写一个指定三角大小，指定三角偏移量的，带背景颜色的widget
/// @Author:         yang
/// @CreateDate:     2021/8/5 10:18
/// @UpdateDate:     2021/8/5 10:18
/// @UpdateRemark:   更新说明
/// @Version:        1.0

class ThreeSan extends StatelessWidget {
  ///三角形是否居中
  bool isCenter;

  ///偏移量
  final double offset;

  ///三角形的高
  final double sanHeight;

  ///三角形的宽度
  double sanWidth;

  ///三角形的顶部角度
  final int sanAngle;

  ///间距
  double? padding;
  Key? key;

  ///子Widget
  Widget child;

  ///矩形的圆角
  double radius;

  ///背景颜色
  Color background;

  ThreeSan(this.isCenter, this.offset, this.sanWidth, this.sanHeight,
      this.child, this.radius, this.padding, this.background, this.sanAngle,
      {this.key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _padding = padding;
    return Padding(
      padding: EdgeInsets.all(_padding!),
      child: CustomPaint(
        child: child,
        painter: ThreeSanPainter(isCenter, offset, radius, sanWidth, sanHeight,
            sanAngle, background),
      ),
    );
  }
}

class ThreeSanPainter extends CustomPainter {
  bool isCenter;
  double offset;
  double radius;
  double sanWidth;
  double sanHeight;
  int sanAngle;
  Color background;

  ThreeSanPainter(this.isCenter, this.offset, this.radius, this.sanWidth,
      this.sanHeight, this.sanAngle, this.background);

  @override
  void paint(Canvas canvas, Size size) {
    /// 绘制矩形
    var height = size.height;
    var width = size.width;

    Rect rect = Rect.fromCenter(
        center: Offset(width / 2, height / 2), width: width, height: height);
    Path path = Path()..addRRect(RRect.fromRectXY(rect, radius, radius));

    ///绘制三角
    double sanJaoHeight = sanHeight;
    var sanJiaoMovex = sanWidth / 2;
    var sanJiaoMovey = sanJaoHeight;

    Path sanjiaoPath = Path()
      ..moveTo(isCenter ? size.width / 2 - sanWidth / 2 : offset, height)
      ..relativeLineTo(sanJiaoMovex, sanJiaoMovey)
      ..relativeLineTo(sanJiaoMovex, -sanJiaoMovey);

    ///联合两个path
    path = Path.combine(PathOperation.union, sanjiaoPath, path);
    canvas.drawPath(path, Paint()..color = background);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}