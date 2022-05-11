import 'package:get/get.dart';

import '../modules/enroll/enroll_binding.dart';
import '../modules/enroll/enroll_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_view.dart';
import '../modules/message/message_binding.dart';
import '../modules/message/message_view.dart';
import '../modules/my/my_binding.dart';
import '../modules/my/my_view.dart';
import '../modules/setting/setting_binding.dart';
import '../modules/setting/setting_view.dart';
import '../modules/test/banner_swiper/banner_swiper_binding.dart';
import '../modules/test/banner_swiper/banner_swiper_view.dart';
import '../modules/test/basic_widgets/basic_widgets_binding.dart';
import '../modules/test/basic_widgets/basic_widgets_view.dart';
import '../modules/test/custom_icon/custom_icon_binding.dart';
import '../modules/test/custom_icon/custom_icon_view.dart';
import '../modules/test/grid_view/grid_view_binding.dart';
import '../modules/test/grid_view/grid_view_view.dart';
import '../modules/test/list_view/list_view_binding.dart';
import '../modules/test/list_view/list_view_view.dart';
import '../modules/test/little_widgets/little_widgets_binding.dart';
import '../modules/test/little_widgets/little_widgets_view.dart';
import '../modules/test/shanyan/shanyan_binding.dart';
import '../modules/test/shanyan/shanyan_view.dart';
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
import '../modules/test_wanandroid/wa_my/wa_feedback/wa_feedback_binding.dart';
import '../modules/test_wanandroid/wa_my/wa_feedback/wa_feedback_view.dart';
import '../modules/test_wanandroid/wa_my/wa_my_binding.dart';
import '../modules/test_wanandroid/wa_my/wa_my_view.dart';
import '../modules/test_wanandroid/wa_my/wa_setting/wa_setting_binding.dart';
import '../modules/test_wanandroid/wa_my/wa_setting/wa_setting_view.dart';
import '../modules/test_wanandroid/wa_search/wa_search_binding.dart';
import '../modules/test_wanandroid/wa_search/wa_search_view.dart';
import '../modules/user/user_binding.dart';
import '../modules/user/user_view.dart';
import '../modules/webview/webview_binding.dart';
import '../modules/webview/webview_view.dart';
import '../modules/welcome/welcome_binding.dart';
import '../modules/welcome/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TEST;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.USER,
      page: () => UserView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGE,
      page: () => MessageView(),
      binding: MessageBinding(),
    ),
    GetPage(
      name: _Paths.MY,
      page: () => MyView(),
      binding: MyBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
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
          name: _Paths.BANNER_SWIPER,
          page: () => BannerSwiperView(),
          binding: BannerSwiperBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.ENROLL,
      page: () => EnrollView(),
      binding: EnrollBinding(),
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
      ],
    ),
  ];
}
