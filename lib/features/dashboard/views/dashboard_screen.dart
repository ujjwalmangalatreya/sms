import 'package:flutter/material.dart';
import 'package:schoolmgmt/core/constants/colors.dart';
import 'package:schoolmgmt/core/constants/images.dart';
import 'package:schoolmgmt/features/dashboard/views/dashboard_details.dart';

import '../../../core/widgets/common/drawer.dart';
import '../../auth/controllers/auth_controller.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  final AuthController authController = AuthController.instance;

  final _pages = [
    Center(child: DashboardDetails()),
    Center(child: Text('STUDENTS PAGE')),
    Center(child: Text('EMPLOYEE PAGE')),
    Center(child: Text('PROFILE PAGE'))
  ];

  void updateSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = authController.authUser;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          backgroundColor: TColors.dashboardAppBar,
          title: const Text('Dashboard'),
          leadingWidth: 300,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.all(8.0), // Adjust padding as needed
            child: SizedBox(
              width: 140, // Set the width of the logo
              height: 140, // Set the height of the logo
              child: Image.asset(
                TImages.statechLogo, // Replace with your logo's path
                fit: BoxFit.contain,
              ),
            ),
          ),
          actions: [
            CircleAvatar(
              radius: 25,
              child: Text("UMA"),
            ),
            Text(user?.email ?? "hello@gmail.com"),
          ],
        ),
      ),
      body: Row(
        children: [
          DrawerMenu(
            selectedIndex: _selectedIndex,
            onMenuSelected: updateSelectedIndex,
          ),
          Expanded(child: _pages[_selectedIndex]),

          // After Card Section
        ],
      ),
    );
  }
}
