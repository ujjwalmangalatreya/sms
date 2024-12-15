import 'package:get/get.dart';
import 'package:schoolmgmt/features/auth/bindings/auth_binding.dart';
import 'package:schoolmgmt/features/auth/views/login_screen.dart';
import 'package:schoolmgmt/features/dashboard/views/dashboard_screen.dart';
import 'package:schoolmgmt/features/home_screen.dart/home_screen.dart';
import 'package:schoolmgmt/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.initialRoutes,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: AuthBiniding(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardPage(),
    )
  ];
}
