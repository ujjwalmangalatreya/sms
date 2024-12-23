import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_fonts.dart';
import '../../profile/views/web_profile.dart';

class AllStudent extends StatelessWidget {
  const AllStudent({super.key});

  @override
  Widget build(BuildContext context) {
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
                          "All employee",
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
        // Search Bar
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 10, 0, 0),
          child: Stack(
            children: [
              // Main Container
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Colors.blueAccent, // Border color
                      width: 1.0, // Border thickness
                    ),
                  ),
                  child: employeeSearchTextField(),
                ),
              ),
              positionedText("Search Employee"),
            ],
          ),
        ),
        SizedBox(height: 10),
        //Employee Card.
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 10, 0, 0),
          child: employeeCard(employees),
        ),
      ],
    );
  }
}

Widget employeeSearchTextField() {
  return TextFormField(
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

Widget employeeCard(List<Map<String, dynamic>> employees) {
  return GridView.builder(
    shrinkWrap: true,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4, // Number of columns
      crossAxisSpacing: 20.0, // Space between columns
      mainAxisSpacing: 20.0, // Space between rows
      childAspectRatio: 1.5, // Width-to-height ratio of each grid item
    ),
    itemCount: employees.isNotEmpty
        ? employees.length + 1
        : 1, // Add "New" card if employees exist
    itemBuilder: (context, index) {
      // Show "New" card if it's the last card or if there are no employees
      if (employees.isEmpty || index == employees.length) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3), // Shadow color
                  spreadRadius: 2, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: Offset(0, 3), // Offset in x and y directions
                ),
              ],
              border: Border.all(
                color: Colors.grey,
                style: BorderStyle.none, // Change to dotted if needed
              ),
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white60,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.add, size: 30.0, color: Colors.grey),
                  SizedBox(height: 5.0),
                  Text(
                    "Add Employee",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }

      // Regular employee card
      final employee = employees[index];
      return Container(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          color: Colors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(employee["photoUrl"]),
                    radius: 50.0,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    employee["name"],
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          Get.snackbar("", "TODO the edit part");
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          Get.snackbar("", "TODO the delete part");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

List<Map<String, dynamic>> employees = [
  {
    "photoUrl":
        "https://t4.ftcdn.net/jpg/03/78/43/25/360_F_378432516_6IlKiCLDAqSCGcfc6o8VqWhND51XqfFm.jpg",
    "name": "Ram Narayan Shrestha",
  },
  {
    "photoUrl":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTefdAYZ6uy2rn4ODl9zSL1KwCAhiEPo9Xm-g&s",
    "name": "Asmita Bhandari",
  },
  {
    "photoUrl":
        "https://c8.alamy.com/comp/2AKFTT6/passport-photo-of-african-american-mature-adult-man-isolated-on-white-background-for-cut-out-2AKFTT6.jpg",
    "name": "Asmita Bhandari",
  },
  {
    "photoUrl":
        "https://www.shutterstock.com/image-photo/portrait-real-black-african-man-260nw-504738538.jpg",
    "name": "Asmita Bhandari",
  },
];
