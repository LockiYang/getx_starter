import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/common/styles/zstyle.dart';
import 'package:getx_test/app/modules/app_job/services/config_service.dart';

import 'job_splash_controller.dart';

class JobSplashView extends GetView<JobSplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
              bottom: MediaQuery.of(context).padding.bottom + 10,
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/icons/icon.png',
                        width: 60,
                      )),
                  Spacez.vSpacezMd,
                  Text(
                    ConfigService.appName!,
                    style: ZStyle.textSubHead,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
