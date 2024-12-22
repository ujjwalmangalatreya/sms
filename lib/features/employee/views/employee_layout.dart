import 'package:flutter/material.dart';
import 'package:schoolmgmt/core/constants/app_fonts.dart';
import 'package:schoolmgmt/features/employee/views/add_employee.dart';
import 'package:schoolmgmt/features/employee/views/jobletter_employee.dart';
import 'package:schoolmgmt/features/employee/views/manageLogin_employee.dart';

import 'all_employee.dart';

class Employee extends StatelessWidget {
  const Employee({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8.0), // Outer margin for the TabBar
            padding: EdgeInsets.all(4.0), // Inner padding for better spacing
            decoration: BoxDecoration(
              color:
                  Colors.blue.shade50, // Background color for the TabBar area
              borderRadius: BorderRadius.circular(16.0), // Rounded corners
            ),
            child: TabBar(
              tabs: [
                Tab(text: "All Employee"),
                Tab(text: "Add New"),
                Tab(text: "Job Letter"),
                Tab(text: "Manage Login"),
              ],
              indicator: BoxDecoration(
                color: Colors.blue, // Active tab background color
                borderRadius: BorderRadius.circular(
                    12.0), // Rounded corners for active tab
              ),
              labelColor: Colors.white, // Text color for active tab
              unselectedLabelColor:
                  Colors.black, // Text color for inactive tabs
              labelStyle: AppFonts.tabHeader, // Style for active tab text
              unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.normal), // Style for inactive tab text
              indicatorSize: TabBarIndicatorSize
                  .tab, // Match the size of the indicator to the tab
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                AllEmployee(),
                AddEmployee(),
                JobletterEmployee(),
                ManageloginEmployee(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
