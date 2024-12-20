import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmgmt/features/dashboard/views/dashboard_details.dart';

import '../../../features/dashboard/views/profile.dart';
import '../../../features/dashboard/views/student.dart';
import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../controller/navigation_controller.dart';

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

class SharedDrawer extends StatelessWidget {
  const SharedDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0, // Remove shadow for web-style sidebar
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerItem(
            title: 'Dashboard',
            index: 0,
          ),
          DrawerItem(
            title: 'Profile',
            index: 1,
          ),
          DrawerItem(
            title: 'Students',
            index: 2,
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final NavigationController controller = Get.find<NavigationController>();
  final String title;
  final int index;

  DrawerItem({
    super.key,
    required this.title,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isSelected = controller.currentIndex.value == index;
      return ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.blue : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        selected: isSelected,
        selectedTileColor: Colors.blue[50], // Highlight selected tile
        onTap: () {
          controller.changePage(index);
        },
      );
    });
  }
}
