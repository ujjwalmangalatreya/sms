import 'package:flutter/material.dart';

import '../../../core/constants/app_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Flexible(
            flex: 1, // Adjust column size ratio
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF7E5E9), // Background color (#f7e5e9)
                  border: Border.all(
                    color: const Color(0xFFF7E5E9), // Border color (#f7e5e9)
                    width: 1.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 10, 0, 0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings, // Choose an appropriate icon
                            color: Colors.black, // Set the icon color
                            size: 24.0, // Set the icon size
                          ),
                          const SizedBox(
                              width: 8.0), // Add space between icon and text
                          Text(
                            "GENERAL SETTINGS",
                            style: AppFonts.generalSettingsHeading,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 10, 0, 0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.home, // Choose an appropriate icon
                            color: Colors.black, // Set the icon color
                            size: 24.0, // Set the icon size
                          ),
                          const SizedBox(
                              width: 8.0), // Add space between icon and text
                          Text(
                            "Institute Profile",
                            style: AppFonts.generalSettingsHeading,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "UPDATE PROFILE",
            style: AppFonts.updateProfileHeader,
          ),
        ],
      ),
    );
  }
}
