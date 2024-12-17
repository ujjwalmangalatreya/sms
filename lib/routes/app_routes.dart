import 'package:get/get.dart';
import 'package:schoolmgmt/features/auth/views/login_screen.dart';
import 'package:schoolmgmt/features/dashboard/views/dashboard_screen.dart';
import 'package:schoolmgmt/features/home_screen.dart/home_screen_web_view.dart';
import 'package:schoolmgmt/routes/routes.dart';

class TAppRoutes {
  static final List<GetPage> pages = [
    GetPage(name: TRoutes.initialRoute, page: () => HomeScreen()),
    GetPage(name: TRoutes.login, page: () => LoginPage()),
    GetPage(name: TRoutes.dashboard, page: () => DashboardPage()),
  ];
}
