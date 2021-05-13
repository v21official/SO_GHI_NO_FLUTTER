import 'package:get/get.dart';
import 'package:monitorflutter/app/modules/dashboard_module/empty_dashboard/empty_dashboard_page.dart';
import 'package:monitorflutter/app/modules/service_module/add_service/add_service.dart';
import 'package:monitorflutter/app/modules/service_module/list_service_detail/list_service_detail.dart';
import 'package:monitorflutter/app/modules/user_info_module/forgot_password/forgot_password_page.dart';
import 'package:monitorflutter/app/modules/user_info_module/login/login_page.dart';
import 'package:monitorflutter/app/modules/user_info_module/register/register_page.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      //binding: testBinding(),
    ),
    GetPage(
      name: Routes.EMPTY_DASHBOARD,
      page: () => EmptyDashboardPage(),
      //binding: LogNotificationBindings(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => ForgotPasswordPage(),
      //binding: testBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterPage(),
      //binding: LogNotificationBindings(),
    ),
    GetPage(
      name: Routes.ADD_SERVICE,
      page: () => AddServiceScreen(),
    ),
    GetPage(
      name: Routes.LIST_SERVICE_DETAIL,
      page: () => ListServiceDetailStateScreen(),
      //binding: LogNotificationBindings(),
    ),
  ];
}
