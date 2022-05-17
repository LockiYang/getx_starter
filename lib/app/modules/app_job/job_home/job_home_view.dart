import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/modules/app_job/job_home/job_home_binding.dart';

import '../../../common/getx/getz_view_binding.dart';
import 'job_home_controller.dart';

class JobHomeView extends GetzViewBindng<JobHomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        body: Column(children: [
          Container(color: Colors.red, height: 60,),
          Container(color: Colors.green, height: 200.w,)
        ]),
      ),
    );
  }

  @override
  Bindings? binding() {
    return JobHomeBinding();
  }
}
