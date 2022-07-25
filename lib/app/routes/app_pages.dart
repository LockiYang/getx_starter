import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../modules/test/basic_widgets/basic_widgets_binding.dart';
import '../modules/test/basic_widgets/basic_widgets_view.dart';
import '../modules/test/city/city_binding.dart';
import '../modules/test/city/city_view.dart';
import '../modules/test/custom_icon/custom_icon_binding.dart';
import '../modules/test/custom_icon/custom_icon_view.dart';
import '../modules/test/device_info/device_info_binding.dart';
import '../modules/test/device_info/device_info_view.dart';
import '../modules/test/grid_view/grid_view_binding.dart';
import '../modules/test/grid_view/grid_view_view.dart';
import '../modules/test/list_view/list_view_binding.dart';
import '../modules/test/list_view/list_view_view.dart';
import '../modules/test/little_widgets/little_widgets_binding.dart';
import '../modules/test/little_widgets/little_widgets_view.dart';
import '../modules/test/sdk_shanyan/shanyan_binding.dart';
import '../modules/test/sdk_shanyan/shanyan_view.dart';
import '../modules/test/search/search_binding.dart';
import '../modules/test/search/search_view.dart';
import '../modules/test/sliver_widgets/sliver_widgets_binding.dart';
import '../modules/test/sliver_widgets/sliver_widgets_view.dart';
import '../modules/test/test_binding.dart';
import '../modules/test/test_view.dart';
import '../modules/test_news/news_category/news_category_binding.dart';
import '../modules/test_news/news_category/news_category_view.dart';
import '../modules/test_news/news_home/news_home_binding.dart';
import '../modules/test_news/news_home/news_home_view.dart';
import '../modules/test_news/news_index/news_index_binding.dart';
import '../modules/test_news/news_index/news_index_view.dart';
import '../modules/test_news/news_signin/news_signin_binding.dart';
import '../modules/test_news/news_signin/news_signin_view.dart';
import '../modules/test_news/news_signup/news_signup_binding.dart';
import '../modules/test_news/news_signup/news_signup_view.dart';
import '../modules/test_news/test_news_binding.dart';
import '../modules/test_news/test_news_view.dart';
import '../modules/test_wanandroid/test_wanandroid_binding.dart';
import '../modules/test_wanandroid/test_wanandroid_view.dart';
import '../modules/test_wanandroid/wa_home/wa_home_binding.dart';
import '../modules/test_wanandroid/wa_home/wa_home_view.dart';
import '../modules/test_wanandroid/wa_login/wa_login_binding.dart';
import '../modules/test_wanandroid/wa_login/wa_login_view.dart';
import '../modules/test_wanandroid/wa_my/wa_collect/wa_collect_binding.dart';
import '../modules/test_wanandroid/wa_my/wa_collect/wa_collect_view.dart';
import '../modules/test_wanandroid/wa_my/wa_feedback/wa_feedback_binding.dart';
import '../modules/test_wanandroid/wa_my/wa_feedback/wa_feedback_view.dart';
import '../modules/test_wanandroid/wa_my/wa_my_binding.dart';
import '../modules/test_wanandroid/wa_my/wa_my_view.dart';
import '../modules/test_wanandroid/wa_my/wa_setting/wa_setting_binding.dart';
import '../modules/test_wanandroid/wa_my/wa_setting/wa_setting_view.dart';
import '../modules/test_wanandroid/wa_search/wa_search_binding.dart';
import '../modules/test_wanandroid/wa_search/wa_search_view.dart';
import '../modules/test_wanandroid/wa_video/wa_video_binding.dart';
import '../modules/test_wanandroid/wa_video/wa_video_view.dart';
import '../modules/test_wanandroid/wa_video_detail/wa_video_detail_binding.dart';
import '../modules/test_wanandroid/wa_video_detail/wa_video_detail_view.dart';
import '../modules/webview/webview_binding.dart';
import '../modules/webview/webview_view.dart';
import 'observers.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TEST;
  static final RouteObserver<Route> observer = RouteObservers();

  static final routes = [
    GetPage(
      name: _Paths.TEST,
      page: () => TestView(),
      binding: TestBinding(),
      children: [
        GetPage(
          name: _Paths.BASIC_WIDGETS,
          page: () => BasicWidgetsView(),
          binding: BasicWidgetsBinding(),
        ),
        GetPage(
          name: _Paths.LIST_VIEW,
          page: () => ListViewView(),
          binding: ListViewBinding(),
        ),
        GetPage(
          name: _Paths.GRID_VIEW,
          page: () => GridViewView(),
          binding: GridViewBinding(),
        ),
        GetPage(
          name: _Paths.CUSTOM_ICON,
          page: () => CustomIconView(),
          binding: CustomIconBinding(),
        ),
        GetPage(
          name: _Paths.SLIVER_WIDGETS,
          page: () => SliverWidgetsView(),
          binding: SliverWidgetsBinding(),
        ),
        GetPage(
          name: _Paths.SHANYAN,
          page: () => ShanyanView(),
          binding: ShanyanBinding(),
        ),
        GetPage(
          name: _Paths.LITTLE_WIDGETS,
          page: () => LittleWidgetsView(),
          binding: LittleWidgetsBinding(),
        ),
        GetPage(
          name: _Paths.DEVICE_INFO,
          page: () => DeviceInfoView(),
          binding: DeviceInfoBinding(),
        ),
        GetPage(
          name: _Paths.SEARCH,
          page: () => SearchView(),
          binding: SearchBinding(),
        ),
        GetPage(
          name: _Paths.CITY,
          page: () => CityView(),
          binding: CityBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.TEST_NEWS,
      page: () => TestNewsView(),
      binding: TestNewsBinding(),
      children: [
        GetPage(
          name: _Paths.NEWS_SIGNUP,
          page: () => NewsSignupView(),
          binding: NewsSignupBinding(),
        ),
        GetPage(
          name: _Paths.NEWS_SIGNIN,
          page: () => NewsSigninView(),
          binding: NewsSigninBinding(),
        ),
        GetPage(
          name: _Paths.NEWS_INDEX,
          page: () => NewsIndexView(),
          binding: NewsIndexBinding(),
        ),
        GetPage(
          name: _Paths.NEWS_HOME,
          page: () => NewsHomeView(),
          binding: NewsHomeBinding(),
        ),
        GetPage(
          name: _Paths.NEWS_CATEGORY,
          page: () => NewsCategoryView(),
          binding: NewsCategoryBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.WEBVIEW,
      page: () => WebviewView(),
      binding: WebviewBinding(),
    ),
    GetPage(
      name: _Paths.TEST_WANANDROID,
      page: () => TestWanandroidView(),
      binding: TestWanandroidBinding(),
      children: [
        GetPage(
          name: _Paths.WA_HOME,
          page: () => WaHomeView(),
          binding: WaHomeBinding(),
        ),
        GetPage(
          name: _Paths.WA_MY,
          page: () => WaMyView(),
          binding: WaMyBinding(),
          children: [
            GetPage(
              name: _Paths.WA_SETTING,
              page: () => WaSettingView(),
              binding: WaSettingBinding(),
            ),
            GetPage(
              name: _Paths.WA_FEEDBACK,
              page: () => WaFeedbackView(),
              binding: WaFeedbackBinding(),
            ),
            GetPage(
              name: _Paths.WA_COLLECT,
              page: () => WaCollectView(),
              binding: WaCollectBinding(),
            ),
          ],
        ),
        GetPage(
          name: _Paths.WA_SEARCH,
          page: () => WaSearchView(),
          binding: WaSearchBinding(),
        ),
        GetPage(
          name: _Paths.WA_LOGIN,
          page: () => WaLoginView(),
          binding: WaLoginBinding(),
        ),
        GetPage(
          name: _Paths.WA_VIDEO,
          page: () => WaVideoView(),
          binding: WaVideoBinding(),
        ),
        GetPage(
          name: _Paths.WA_VIDEO_DETAIL,
          page: () => WaVideoDetailView(),
          binding: WaVideoDetailBinding(),
        ),
      ],
    ),
  ];
}
