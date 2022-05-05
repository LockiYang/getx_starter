
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/common/http/config/dio_config.dart';
import 'package:getx_test/app/common/http/http_client.dart';
import 'package:getx_test/app/common/http/http_response.dart';

class HttpTestController extends GetxController {

  late HttpClient client;
  @override
  void onInit() {
    DioConfig config = DioConfig(baseUrl: 'https://www.wanandroid.com/');
    client = HttpClient(dioConfig: config);
    Get.put<HttpClient>(client);
    super.onInit();

  }

  ///首页Tab栏接口
  void tab() async {
    HttpResponse response = await client.get('project/tree/json');
    debugPrint(response.ok.toString());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
