import 'package:flutter/material.dart';
import 'package:schoolmgmt/core/constants/app_fonts.dart';
import 'package:schoolmgmt/features/student/views/add_student.dart';
import 'package:schoolmgmt/features/student/views/jobletter_employee.dart';
import 'package:schoolmgmt/features/student/views/manageLogin_student.dart';

import 'all_student.dart';

class StudentLayout extends StatelessWidget {
  const StudentLayout({super.key});

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
                Tab(text: "All Student"),
                Tab(text: "Add New"),
                Tab(text: "Admission Letter"),
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
                AllStudent(),
                AddStudent(),
                AdmissionLetter(),
                ManageloginStudent(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
