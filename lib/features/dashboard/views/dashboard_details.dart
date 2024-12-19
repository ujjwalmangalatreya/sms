import 'package:flutter/material.dart';
import 'package:schoolmgmt/core/constants/app_fonts.dart';
import 'package:schoolmgmt/core/constants/colors.dart';
import 'package:schoolmgmt/core/widgets/common/dashboard_grid.dart';

class DashboardDetails extends StatefulWidget {
  const DashboardDetails({super.key});

  @override
  State<DashboardDetails> createState() => _DashboardDetailsState();
}

class _DashboardDetailsState extends State<DashboardDetails> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: TColors.dashboardMainBody,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dashboard Grid Section
            const DashboardGrid(),

            const SizedBox(height: 20.0), // Spacing between sections

            // Row with Two Columns
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // First Column
                Flexible(
                  flex: 2, // Adjust column size ratio
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(
                            0xFFF7E5E9), // Background color (#f7e5e9)
                        border: Border.all(
                          color:
                              const Color(0xFFF7E5E9), // Border color (#f7e5e9)
                          width: 1.0, // Border width
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 10, 0, 0),
                            child: Text(
                              "Welcome to Admin Dashboard",
                              style: AppFonts.welcomeNoteHeader,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 10, 0, 0),
                            child: SizedBox(
                              width: 300, // Adjust the width to fit your layout
                              child: Text(
                                "Your Account is not Verified yet! Please verify your email address. Verify now!",
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
                                style: AppFonts.welcomeNoteDetails,
                                textAlign: TextAlign.center, // Adjust alignment if needed
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Second Column
                Flexible(
                  flex: 1, // Adjust column size ratio
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(
                            0xFFE8F7E9), // Different background color
                        border: Border.all(
                          color: const Color(0xFFE8F7E9), // Border color
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Center(
                        child: Text(
                          "Second Column Content",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
