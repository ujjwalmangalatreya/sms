import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmgmt/features/employee/controllers/employee_controller.dart';

import '../../../core/constants/app_fonts.dart';

class AddEmployee extends StatelessWidget {
  const AddEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    final EmployeeController employeeController =
        Get.find<EmployeeController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Header
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
                          "EMPLOYEE",
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
                          "All New",
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
        // OTHER CONTENT
        Center(
          child: Text(
            "Employee Form",
            style: AppFonts.updateProfileHeader,
          ),
        ),
        /**Basic Information */
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            "Basic Information",
            style: AppFonts.tabHeader,
          ),
        ),
        Divider(),
        //OTHER INFORMATION FORM
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            children: [
                              // Main Container
                              Container(
                                height: 60,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                    color: Colors.blueAccent, // Border color
                                    width: 1.0, // Border thickness
                                  ),
                                ),
                                child: profileTextField(
                                    controller: employeeController
                                        .employeeNameController),
                              ),
                              positionedText("Employee Name *"),
                            ],
                          ),
                          Stack(
                            children: [
                              // Main Container
                              Container(
                                height: 60,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                    color: Colors.blueAccent, // Border color
                                    width: 1.0, // Border thickness
                                  ),
                                ),
                                child: profileTextField(
                                    controller: employeeController
                                        .mobileNumberController),
                              ),
                              positionedText("Mobile Number *"),
                            ],
                          ),
                          Stack(
                            children: [
                              // Main Container
                              Container(
                                height: 60,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                    color: Colors.blueAccent, // Border color
                                    width: 1.0, // Border thickness
                                  ),
                                ),
                                child: profileTextField(
                                    controller: employeeController
                                        .employeeRoleController),
                              ),
                              positionedText("Employee Role *"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            children: [
                              // Main Container
                              Container(
                                height: 60,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                    color: Colors.blueAccent, // Border color
                                    width: 1.0, // Border thickness
                                  ),
                                ),
                                child: profileTextField(
                                    controller: employeeController
                                        .choosePictireController),
                              ),
                              positionedText("Choose Picture *"),
                            ],
                          ),
                          Stack(
                            children: [
                              // Main Container
                              Container(
                                height: 60,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                    color: Colors.blueAccent, // Border color
                                    width: 1.0, // Border thickness
                                  ),
                                ),
                                child: profileTextField(
                                    controller: employeeController
                                        .dateOfJoiningController),
                              ),
                              positionedText("Date of Joining *"),
                            ],
                          ),
                          Stack(
                            children: [
                              // Main Container
                              Container(
                                height: 60,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                    color: Colors.blueAccent, // Border color
                                    width: 1.0, // Border thickness
                                  ),
                                ),
                                child: profileTextField(
                                    controller: employeeController
                                        .monthlySalaryController),
                              ),
                              positionedText("Monthly Salary*"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Text(
            "Other Information",
            style: AppFonts.tabHeader,
          ),
        ),
        Divider(),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            children: [
                              // Main Container
                              Container(
                                height: 60,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.blueAccent, // Border color
                                    width: 1.0, // Border thickness
                                  ),
                                ),
                                child: profileTextField(
                                    controller: employeeController
                                        .fatherHusbandNameController),
                              ),
                              positionedText("Father/Husband Name *"),
                            ],
                          ),
                          Stack(
                            children: [
                              // Main Container
                              Container(
                                height: 60,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                    color: Colors.blueAccent, // Border color
                                    width: 1.0, // Border thickness
                                  ),
                                ),
                                child: profileTextField(
                                    controller:
                                        employeeController.genderController),
                              ),
                              positionedText("Gender *"),
                            ],
                          ),
                          Stack(
                            children: [
                              // Main Container
                              Container(
                                height: 60,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                    color: Colors.blueAccent, // Border color
                                    width: 1.0, // Border thickness
                                  ),
                                ),
                                child: profileTextField(
                                    controller: employeeController
                                        .nationalIdController),
                              ),
                              positionedText("National Id *"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            children: [
                              // Main Container
                              Container(
                                height: 60,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                    color: Colors.blueAccent, // Border color
                                    width: 1.0, // Border thickness
                                  ),
                                ),
                                child: profileTextField(
                                    controller: employeeController
                                        .emailAddressController),
                              ),
                              positionedText("Email Address *"),
                            ],
                          ),
                          Stack(
                            children: [
                              // Main Container
                              Container(
                                height: 60,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                    color: Colors.blueAccent, // Border color
                                    width: 1.0, // Border thickness
                                  ),
                                ),
                                child: profileTextField(
                                    controller:
                                        employeeController.educationController),
                              ),
                              positionedText("Education *"),
                            ],
                          ),
                          Stack(
                            children: [
                              // Main Container
                              Container(
                                height: 60,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                    color: Colors.blueAccent, // Border color
                                    width: 1.0, // Border thickness
                                  ),
                                ),
                                child: profileTextField(
                                    controller: employeeController
                                        .homeAddressController),
                              ),
                              positionedText("Home Address "),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Divider(),

        Center(
          child: ElevatedButton(
              onPressed: () {
                employeeController.saveEmployeeData();
              },
              child: Text("Create")),
        ),
      ],
    );
  }
}

Widget positionedText(String positionedText) {
  return Positioned(
    left: 20.0, // Adjust as needed
    top: 0.0, // Adjust as needed
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      decoration: BoxDecoration(
        // color: Colors.blue, // Background color
        border: Border.all(
          color: Colors.white, // Border color
          width: 0.5, // Border width
        ),
        borderRadius: BorderRadius.circular(3.0), // Optional: Rounded corners
      ), // Background for better visibility
      child: Text(
        positionedText,
        style: TextStyle(
          fontSize: 10.0,
          color: Colors.blue,
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
      // filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 28.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
    ),
  );
}
