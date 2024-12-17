import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmgmt/core/widgets/responsive/responsive_layout.dart';
import 'package:schoolmgmt/features/auth/views/mobile_login.dart';
import 'package:schoolmgmt/features/auth/views/tablet_login.dart';
import 'package:schoolmgmt/features/auth/views/web_login.dart';
import 'package:schoolmgmt/features/dashboard/views/dashboard_screen.dart';
import 'package:schoolmgmt/features/home_screen.dart/mobile_view.dart';
import 'package:schoolmgmt/features/home_screen.dart/tablet_view.dart';
import 'package:schoolmgmt/features/home_screen.dart/web_view.dart';
import 'package:schoolmgmt/routes/routes.dart';

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
    ),
    /** Dashboard Screen */
    GetPage(
      name: TRoutes.dashboard,
      page: () => DashboardPage(),
    ),
  ];
}
