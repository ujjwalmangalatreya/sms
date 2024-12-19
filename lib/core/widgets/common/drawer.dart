import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmgmt/core/constants/colors.dart';

import 'drawer_tile.dart';

class DrawerMenu extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onMenuSelected;
  // final AuthController authController = Get.find()<AuthController>();

  DrawerMenu({
    super.key,
    required this.selectedIndex,
    required this.onMenuSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: TColors.dashboardSideNav,
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
            title: 'P R O F I L E',
            isSelected: selectedIndex == 3,
            onTap: () => {onMenuSelected(3)},
          ),
          DrawerTile(
            title: 'L O G O U T',
            isSelected: selectedIndex == 4,
            onTap: () =>
                {Get.snackbar("LOGGING OUT", "Logging out part is in TODO..")},
          ),
        ],
      ),
    );
  }
}
