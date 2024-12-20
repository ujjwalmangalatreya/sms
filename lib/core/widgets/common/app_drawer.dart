import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/navigation_controller.dart';

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
            title: 'D A S H B O A R D',
            index: 0,
          ),
          DrawerItem(
            title: 'S T U D E N T S',
            index: 1,
          ),
          DrawerItem(
            title: 'E M P L O Y E E',
            index: 2,
          ),
          DrawerItem(
            title: 'P R O F I L E',
            index: 3,
          ),
          DrawerItem(
            title: 'L O G O U T',
            index: 4,
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
          if (index == 4) {
            Get.snackbar("LOGGING OUT", "TODO LOGGING OUT");
          }
          controller.changePage(index);
        },
      );
    });
  }
}
