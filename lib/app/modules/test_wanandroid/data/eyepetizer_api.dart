import 'package:get/get.dart';

import '../../../common/http/config/dio_config.dart';
import '../../../common/http/http_util.dart';
import '../common/http/eyepetizer_http_transformer.dart';
import 'feed.dart';

class EyepetizerApi extends GetxService {
  late HttpUtil client;

  Future<EyepetizerApi> init() async {
    DioConfig config = DioConfig(baseUrl: 'http://baobab.kaiyanapp.com/api/');
    client = HttpUtil(dioConfig: config);
    return this;
  }

  /// 首页精选数据
  getFeed(int page, {Success<Feed>? success, Fail? fail}) {
    client.get('v2/feed',
        queryParameters: {'num': page},
        httpTransformer: EyepetizerHttpTransformer.getInstance(),
        success: (data) {
      var result = Feed.fromJson(data as Map<String, dynamic>);
      if (success != null) {
        success(result);
      }
    }, fail: (error) {
      if (fail != null) {
        fail(error);
      }
    });
  }
}
