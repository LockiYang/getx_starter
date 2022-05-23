import 'dart:async';

import 'package:flutter/material.dart';

import 'banner_model.dart';

class BannerWidget extends StatefulWidget {
  /// Banners列表数据
  final List<BannerModel> banners;

  /// Banners高度
  final double height;

  /// 点击位置
  final ValueChanged<int> onTap;

  ///滑动曲线
  final Curve curve;

  BannerWidget(
    this.banners, {
    this.height = 200,
    required this.onTap,
    this.curve = Curves.linear,
  });

  @override
  _BannerState createState() => _BannerState();
}

class _BannerState extends State<BannerWidget> {
  late PageController _pageController;
  late int _curIndex;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _curIndex = widget.banners.length * 5;
    _pageController = PageController(initialPage: _curIndex);
    _initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        _buildPageView(),
        _buildIndicator(),
      ],
    );
  }

  ///指引器
  Widget _buildIndicator() {
    if (widget.banners.isEmpty) {
      return const SizedBox();
    }
    var length = widget.banners.length;
    return Positioned(
      bottom: 10,
      child: Row(
        children: widget.banners.map((s) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: ClipOval(
              child: Container(
                width: 7,
                height: 7,
                color: s == widget.banners[_curIndex % length]
                    ? Colors.white
                    : Colors.grey,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  ///PageView
  Widget _buildPageView() {
    if (widget.banners.isEmpty) {
      return const SizedBox();
    }

    // 计算banner的高度
    double bannerHeight = 150.0;
    int imageWidth = 1;
    int imageHeight = 1;
    Image image = Image.asset('assets/images/banner.png');
    image.image.resolve(ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo info, bool _) {
          imageWidth = info.image.width;
          imageHeight = info.image.height;
        },
      ),
    );
    double width = MediaQuery.of(context).size.width;
    bannerHeight =  imageHeight/imageWidth*width;

    var length = widget.banners.length;
    return SizedBox(
      height: bannerHeight,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        physics: const PageScrollPhysics(parent: BouncingScrollPhysics()),
        onPageChanged: (index) {
          setState(() {
            _curIndex = index;
            if (index == 0) {
              _curIndex = length;
              _changePage();
            }
          });
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onPanDown: (details) {
              _cancelTimer();
            },

            ///回传点击位置
            onTap: () {
              widget.onTap(index % length);
            },
            child: Container(
              // margin: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                // borderRadius: BorderRadius.circular(20),
                child: widget.banners[index % length].isAssets
                    ? Container(
                        color: Color(0xFFFBE240),
                        child: Image.asset(
                            widget.banners[index % length].imagePath),
                      )
                    : Image.network(
                        widget.banners[index % length].imagePath,
                        fit: BoxFit.fitWidth,
                      ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// 点击到图片的时候取消定时任务
  _cancelTimer() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
      _initTimer();
    }
  }

  /// 初始化定时任务
  _initTimer() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
    _timer ??= Timer.periodic(const Duration(seconds: 3), (t) {
      if (widget.banners.isEmpty) {
        return;
      }
      _curIndex++;
      if (!_pageController.hasClients) {
        return;
      }
      _pageController.animateToPage(
        _curIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    });
  }

  /// 切换页面，并刷新小圆点
  _changePage() {
    Timer(const Duration(milliseconds: 350), () {
      _pageController.jumpToPage(_curIndex);
    });
  }
}
