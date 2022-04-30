import 'package:get/get.dart';

import '../modules/enroll/bindings/enroll_binding.dart';
import '../modules/enroll/views/enroll_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/message/bindings/message_binding.dart';
import '../modules/message/views/message_view.dart';
import '../modules/my/bindings/my_binding.dart';
import '../modules/my/views/my_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/test/basic_widgets/basic_widgets_binding.dart';
import '../modules/test/basic_widgets/basic_widgets_view.dart';
import '../modules/test/custom_icon/custom_icon_binding.dart';
import '../modules/test/custom_icon/custom_icon_view.dart';
import '../modules/test/grid_view/grid_view_binding.dart';
import '../modules/test/grid_view/grid_view_view.dart';
import '../modules/test/list_view/list_view_binding.dart';
import '../modules/test/list_view/list_view_view.dart';
import '../modules/test/sliver_widgets/sliver_widgets_binding.dart';
import '../modules/test/sliver_widgets/sliver_widgets_view.dart';
import '../modules/test/test_binding.dart';
import '../modules/test/test_view.dart';
import '../modules/user/bindings/user_binding.dart';
import '../modules/user/views/user_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

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
      ],
    ),
    GetPage(
      name: _Paths.ENROLL,
      page: () => EnrollView(),
      binding: EnrollBinding(),
    ),
  ];
}
