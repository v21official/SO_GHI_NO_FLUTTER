import 'package:get/get.dart';
import 'package:monitorflutter/app/modules/history_module/home_page.dart';
import 'package:monitorflutter/app/modules/service_module/add_service/add_service.dart';
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
      name: Routes.HOME,
      page: () => HomePage(),
      //binding: LogNotificationBindings(),
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
  ];
}
