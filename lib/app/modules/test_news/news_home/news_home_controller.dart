import 'package:get/get.dart';

import '../../../data/categories.dart';
import '../../../data/channels.dart';
import '../../../data/news.dart';
import '../common/news_api.dart';

class NewsHomeController extends GetxController {
  // 分类
  final categories = Rx<List<CategoryResponseEntity>?>(null);
  // 新闻翻页
  final newsPageList = Rx<NewsPageListResponseEntity?>(null);
  // 新闻推荐
  final newsRecommend = Rx<NewsItem?>(null);
  // 频道
  final channels = Rx<List<ChannelResponseEntity>?>(null);
  // 选中的分类Code
  final selCategoryCode = "".obs;

  // 拉取数据
  asyncLoadAllData() async {
    categories.value = await NewsAPI.categories(
      cacheDisk: true,
    );
    channels.value = await NewsAPI.channels(
      cacheDisk: true,
    );
    newsRecommend.value = await NewsAPI.newsRecommend(
      cacheDisk: true,
    );
    newsPageList.value = await NewsAPI.newsPageList(
      cacheDisk: true,
    );

    selCategoryCode.value = categories.value!.first.code;
  }

  // 拉取推荐、新闻
  asyncLoadNewsData(
    categoryCode, {
    bool refresh = false,
  }) async {
    selCategoryCode.value = categoryCode;
    newsRecommend.value = await NewsAPI.newsRecommend(
      params: NewsRecommendRequestEntity(categoryCode: categoryCode),
      refresh: refresh,
      cacheDisk: true,
    );
    newsPageList.value = await NewsAPI.newsPageList(
      params: NewsPageListRequestEntity(categoryCode: categoryCode),
      refresh: refresh,
      cacheDisk: true,
    );
  }


  @override
  void onReady() {
    super.onReady();
    asyncLoadAllData();
  }

  @override
  void onClose() {}
}
