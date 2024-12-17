import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmgmt/core/utils/responsive_layout.dart';
import 'package:schoolmgmt/features/auth/views/login_screen.dart';
import 'package:schoolmgmt/features/dashboard/views/dashboard_screen.dart';
import 'package:schoolmgmt/features/home_screen.dart/web_view.dart';
import 'package:schoolmgmt/routes/routes.dart';

class TAppRoutes {
  static final List<GetPage> pages = [
    GetPage(
      name: TRoutes.home,
      page: () => ResponsiveLayout(
        mobileView: Center(child: Text("Mobile View")),
        tabletView: Center(child: Text("Tablet View")),
        webView: HomeScreen(),
      ),
    ),
    GetPage(
        name: TRoutes.login,
        page: () => ResponsiveLayout(
              mobileView: Center(child: Text("Mobile View")),
              tabletView: Center(child: Text("Tablet View")),
              webView: LoginPage(),
            )),
    GetPage(name: TRoutes.dashboard, page: () => DashboardPage()),
  ];
}
