import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmgmt/features/profile/controllers/profile_controller.dart';

import '../../../core/constants/app_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.find<ProfileController>();

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
          SizedBox(height: 20),
          Text("UPDATE PROFILE", style: AppFonts.updateProfileHeader),
          //Profile Edit Forms
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // PROFILE EDIT FORM SECTION...
              Flexible(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(18.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // LeftColumn - Logo and Address
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /*Institution Logo*/
                                    Stack(
                                      children: [
                                        // Main Container
                                        Container(
                                          height: 200,
                                          width: 300,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            border: Border.all(
                                              color: Colors
                                                  .blueAccent, // Border color
                                              width: 1.0, // Border thickness
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              //Profile Pic
                                              Expanded(
                                                flex: 3,
                                                child: CircleAvatar(
                                                  radius: 55,
                                                ),
                                              ),
                                              //Upload button
                                              Expanded(
                                                flex: 1,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: Colors
                                                            .blue[
                                                        200], // Background color
                                                    foregroundColor: Colors
                                                        .white, // Text color
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15), // Rounded corners
                                                    ),
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 12.0,
                                                        horizontal:
                                                            10.0), // Adjust padding
                                                    minimumSize: const Size(0,
                                                        0), // Optional: Remove default minimum size
                                                  ),
                                                  onPressed: () {},
                                                  child:
                                                      const Text('Upload Logo'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        // Positioned Text
                                        positionedText("Institution Logo *"),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    /* Name of Institute*/
                                    Stack(
                                      children: [
                                        // Main Container
                                        Container(
                                          height: 60,
                                          width: 300,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            border: Border.all(
                                              color: Colors
                                                  .blueAccent, // Border color
                                              width: 1.0, // Border thickness
                                            ),
                                          ),
                                          child: profileTextField(
                                              controller: profileController
                                                  .nameController),
                                        ),
                                        positionedText("Name of Institute *"),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    /*Target Line*/
                                    Stack(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 300,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            border: Border.all(
                                              color: Colors
                                                  .blueAccent, // Border color
                                              width: 1.0, // Border thickness
                                            ),
                                          ),
                                          child: profileTextField(
                                              controller: profileController
                                                  .targetLineController),
                                        ),
                                        positionedText("Target Line *"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /*Phone Number*/
                                    Stack(
                                      children: [
                                        // Main Container
                                        Container(
                                          height: 60,
                                          width: 300,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            border: Border.all(
                                              color: Colors
                                                  .blueAccent, // Border color
                                              width: 1.0, // Border thickness
                                            ),
                                          ),
                                          child: profileTextField(
                                              controller: profileController
                                                  .phoneController),
                                        ),
                                        positionedText("Phone Number *"),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    /* WebSite*/
                                    Stack(
                                      children: [
                                        // Main Container
                                        Container(
                                          height: 60,
                                          width: 300,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            border: Border.all(
                                              color: Colors
                                                  .blueAccent, // Border color
                                              width: 1.0, // Border thickness
                                            ),
                                          ),
                                          child: profileTextField(
                                              controller: profileController
                                                  .websiteController),
                                        ),
                                        positionedText("WebSite"),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    /*Address*/
                                    Stack(
                                      children: [
                                        // Main Container
                                        Container(
                                          height: 60,
                                          width: 300,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            border: Border.all(
                                              color: Colors
                                                  .blueAccent, // Border color
                                              width: 1.0, // Border thickness
                                            ),
                                          ),
                                          child: profileTextField(
                                              controller: profileController
                                                  .addressController),
                                        ),
                                        positionedText("Address *"),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    // Country
                                    Stack(
                                      children: [
                                        // Main Container
                                        Container(
                                          height: 60,
                                          width: 300,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            border: Border.all(
                                              color: Colors
                                                  .blueAccent, // Border color
                                              width: 1.0, // Border thickness
                                            ),
                                          ),
                                          child: profileTextField(
                                              controller: profileController
                                                  .countryController),
                                        ),
                                        positionedText("Country *"),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    // UPDATE BUTTON.
                                    ElevatedButton(
                                        onPressed: () {
                                          profileController.saveProfileData();
                                        },
                                        child: Text("UPDATE"))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // PROFILE DETAILS SECTIONS.....
              Flexible(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(18.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // LeftColumn - Logo and Address
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(child: CircleAvatar()),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Obx(
                                      () => Center(
                                        child: Text(
                                          profileController.name.value,
                                          style:
                                              AppFonts.generalSettingsHeading,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Obx(
                                      () => Center(
                                        child: Text(
                                          profileController.targetLine.value,
                                          style:
                                              AppFonts.generalSettingsHeading,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Divider(),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.phone_android),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Obx(() => Text(
                                            profileController.phone.value)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.web),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Obx(() => Text(
                                            profileController.website.value)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.location_on),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Obx(() => Text(
                                            profileController.address.value)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.location_on),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Obx(() => Text(
                                            profileController.country.value)),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget positionedText(String positionedText) {
  return Positioned(
    left: 15.0, // Adjust as needed
    top: 0.0, // Adjust as needed
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      decoration: BoxDecoration(
        color: Colors.blue, // Background color
        border: Border.all(
          color: Colors.white, // Border color
          width: 1.0, // Border width
        ),
        borderRadius: BorderRadius.circular(8.0), // Optional: Rounded corners
      ), // Background for better visibility
      child: Text(
        positionedText,
        style: TextStyle(
          fontSize: 12.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget profileTextField({
  required TextEditingController controller,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 28.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
    ),
  );
}
