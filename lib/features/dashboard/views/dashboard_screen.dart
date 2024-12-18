import 'package:flutter/material.dart';
import 'package:schoolmgmt/core/constants/images.dart';
import '../../../core/widgets/common/drawer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final _pages = [
    Center(child: Text('DASHBOARD PAGE')),
    Center(child: Text('STUDENTS PAGE')),
    Center(child: Text('EMPLOYEE PAGE')),

  ];

  void updateSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0), // Adjust padding as needed
          child: SizedBox(
            width: 140, // Set the width of the logo
            height: 140, // Set the height of the logo
            child: Image.asset(
              TImages.schoolLogo, // Replace with your logo's path
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      body: Row(
        children: [
          DrawerMenu(
            selectedIndex: _selectedIndex,
            onMenuSelected: updateSelectedIndex,
          ),
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
    );
  }
}
