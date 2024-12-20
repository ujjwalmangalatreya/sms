import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmgmt/features/dashboard/views/dashboard_details.dart';

import '../../../features/employee/views/employee.dart';
import '../../../features/profile/views/web_profile.dart';
import '../../../features/student/views/student.dart';
import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../controller/navigation_controller.dart';
import 'app_drawer.dart';

class AppLayout extends StatelessWidget {
  final NavigationController controller = Get.find<NavigationController>();
  AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          backgroundColor: TColors.dashboardAppBar,
          title: const Text('Dashboard'),
          leadingWidth: 300,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 140,
              height: 140,
              child: Image.asset(
                TImages.statechLogo,
                fit: BoxFit.contain,
              ),
            ),
          ),
          actions: const [
            CircleAvatar(
              radius: 25,
              child: Text("UMA"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Center(
                child: Text("hello@gmail.com"),
              ),
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          // Persistent Drawer
          const SizedBox(
            width: 250, // Set drawer width
            child: SharedDrawer(),
          ),
          // Main Content
          Expanded(
            child: Obx(() {
              switch (controller.currentIndex.value) {
                case 0:
                  return DashboardDetails();
                case 1:
                  return Student();
                case 2:
                  return Employee();
                case 3:
                  return Profile();
                default:
                  return DashboardDetails();
              }
            }),
          ),
        ],
      ),
    );
  }
}
