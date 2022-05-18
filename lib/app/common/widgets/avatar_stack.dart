import 'package:flutter/material.dart';

class AvatarStack extends StatelessWidget {
  const AvatarStack({Key? key, this.num = 3, this.size = 40, this.offset = 20})
      : super(key: key);

  final int num;
  final double size;
  final double offset;

  double _getStackWidth(int imgNum) {
    return offset * (imgNum - 1) + size;
  }

  List<Widget> _getStackItems(int count) {
    List<Widget> _list = <Widget>[];
    for (var i = 0; i < count; i++) {
      double off = offset * i;
      _list.add(Positioned(
        left: off,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(size),
          child: Image(
            image: AssetImage("assets/images/customer.jpg"),
            width: size,
            height: size,
          ),
        ),
      ));
    }
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _getStackWidth(num),
      height: size,
      child: Stack(
        children: _getStackItems(num),
      ),
    );
  }
}
