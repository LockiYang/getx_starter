import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvatarStack extends StatelessWidget {
  const AvatarStack(
      {Key? key, this.size = 40, this.offset = 20, required this.avatarUrls})
      : super(key: key);

  final List<String> avatarUrls;
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
            child: CachedNetworkImage(
              imageUrl: avatarUrls[i],
              width: size,
              height: size,
            )),
      ));
    }
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _getStackWidth(avatarUrls.length),
      height: size,
      child: Stack(
        children: _getStackItems(avatarUrls.length),
      ),
    );
  }
}
