import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmgmt/features/auth/controllers/auth_controller.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  final AuthController authController = Get.find<AuthController>();

  final _pages = [
    Center(child: Text('Page 1')),
    Center(child: Text('Page 2')),
    Center(child: Text('Page 3')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text('D A S H B O A R D'),
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('S T U D E N T S'),
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('L O G O U T'),
              onTap: () {
                authController.logout();
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
