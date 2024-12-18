import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'drawer_tile.dart';

class DrawerMenu extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onMenuSelected;

  const DrawerMenu({
    Key? key,
    required this.selectedIndex,
    required this.onMenuSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerTile(
            title: 'D A S H B O A R D',
            isSelected: selectedIndex == 0,
            onTap: () => onMenuSelected(0),
          ),
          DrawerTile(
            title: 'S T U D E N T S',
            isSelected: selectedIndex == 1,
            onTap: () => onMenuSelected(1),
          ),
          DrawerTile(
            title: 'E M P L O Y E E',
            isSelected: selectedIndex == 2,
            onTap: () => onMenuSelected(2),
          ),
          DrawerTile(
            title: 'L O G O U T',
            isSelected: selectedIndex == 3,
            onTap: () => {
              Get.snackbar("LOGGING OUT", "Logging out part is in TODO..")
            },
          ),
        ],
      ),
    );
  }
}
