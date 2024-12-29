import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmgmt/core/services/auth_services.dart';
import 'package:schoolmgmt/features/employee/controllers/employee_controller.dart';

import '../../controller/navigation_controller.dart';

class SharedDrawer extends StatelessWidget {
  const SharedDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0, // Remove shadow for web-style sidebar
      child: ListView(
        padding: EdgeInsets.all(8),
        children: [
          DrawerItem(
            title: 'D A S H B O A R D',
            index: 0,
            icon: Icon(Icons.home),
          ),
          DrawerItem(
            title: 'S T U D E N T S',
            index: 1,
            icon: Icon(Icons.school),
          ),
          DrawerItem(
            title: 'E M P L O Y E E',
            index: 2,
            icon: Icon(Icons.people),
          ),
          DrawerItem(
            title: 'P R O F I L E',
            index: 3,
            icon: Icon(Icons.person),
          ),
          Divider(
            thickness: 0.05,
            color: Colors.black,
          ),
          DrawerItem(
            title: 'L O G O U T',
            index: 4,
            icon: Icon(Icons.lock),
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final NavigationController controller = Get.find<NavigationController>();
  final AuthServices authServices = Get.find<AuthServices>();
  final EmployeeController employeeController = Get.find<EmployeeController>();
  final String title;
  final int index;
  final Icon icon;

  DrawerItem({
    super.key,
    required this.title,
    required this.index,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isSelected = controller.currentIndex.value == index;
      return ListTile(
        leading: icon,
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.blue[900] : Colors.black,
            fontWeight: isSelected ? FontWeight.normal : FontWeight.normal,
          ),
        ),
        selected: isSelected,
        selectedTileColor: Colors.blue[100], // Highlight selected tile
        onTap: () async {
          if (index == 3) {
            employeeController.getAllEmployees();
          }
          if (index == 4) {
            try {
              await authServices.logOutUser(); // Call the logout method
              Get.offAllNamed('/login'); // Redirect to login page
              Get.snackbar("LOGOUT SUCCESS", "You have been logged out.");
            } catch (e) {
              Get.snackbar("LOGOUT FAILED", "An error occurred: $e");
            }
          } else {
            controller.changePage(index);
          }
        },
      );
    });
  }
}
