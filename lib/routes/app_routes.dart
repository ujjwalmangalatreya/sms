import 'package:get/get.dart';
import 'package:schoolmgmt/core/middlewares/auth_middleware.dart';
import 'package:schoolmgmt/core/widgets/common/app_layout.dart';
import 'package:schoolmgmt/core/widgets/responsive/responsive_layout.dart';
import 'package:schoolmgmt/features/auth/bindings/auth_binding.dart';
import 'package:schoolmgmt/features/auth/views/mobile_login.dart';
import 'package:schoolmgmt/features/auth/views/tablet_login.dart';
import 'package:schoolmgmt/features/auth/views/web_login.dart';
import 'package:schoolmgmt/features/employee/binding/employee_binding.dart';
import 'package:schoolmgmt/features/home_screen.dart/mobile_view.dart';
import 'package:schoolmgmt/features/home_screen.dart/tablet_view.dart';
import 'package:schoolmgmt/features/home_screen.dart/web_view.dart';
import 'package:schoolmgmt/routes/routes.dart';

import '../features/profile/bindings/profile_binding.dart';

class TAppRoutes {
  static final List<GetPage> pages = [
    /** Home Screen ***/
    GetPage(
      name: TRoutes.home,
      page: () => ResponsiveLayout(
        mobileView: MobileHomeScreen(),
        tabletView: TabletHomeScreen(),
        webView: WebHomeScreen(),
      ),
    ),
    /** Login Screen */
    GetPage(
      name: TRoutes.login,
      page: () => ResponsiveLayout(
        mobileView: MobileLoginPage(),
        tabletView: TabletLoginPage(),
        webView: WebLoginPage(),
      ),
      binding: AuthBinding(),
    ),
    /** Dashboard Screen */
    GetPage(
      name: TRoutes.dashboard,
      page: () => AppLayout(),
      bindings: [AuthBinding(), EmployeeBinding()],
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: TRoutes.profile,
      page: () => AppLayout(),
      bindings: [AuthBinding(), ProfileBinding()],
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: TRoutes.student,
      page: () => AppLayout(),
      bindings: [AuthBinding(), EmployeeBinding()],
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: TRoutes.employee,
      page: () => AppLayout(),
      bindings: [AuthBinding(), EmployeeBinding()],
      middlewares: [AuthMiddleware()],
    ),
  ];
}
