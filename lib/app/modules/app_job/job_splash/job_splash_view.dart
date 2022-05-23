import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/common/styles/zstyle.dart';

import 'job_splash_controller.dart';

class JobSplashView extends GetView<JobSplashController> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            top: size.height * 0.3,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/icons/icon.png',
                  width: size.width * 0.2,
                )),
          ),
          Positioned(
              bottom: size.height * 0.1,
              child: Text(
                '欢迎来到无忧兼职',
                style: ZStyle.textHead,
              ))
        ],
      ),
    );
  }
}
