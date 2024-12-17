import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmgmt/core/constants/colors.dart';
import 'package:schoolmgmt/core/constants/app_fonts.dart';
import 'package:schoolmgmt/core/constants/images.dart';
import 'package:schoolmgmt/core/widgets/login_cirular_avatar.dart';
import 'package:schoolmgmt/routes/routes.dart';

class MobileLoginPage extends StatelessWidget {
  const MobileLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _LoginFirstSection(),
      ),
    );
  }
}

class _LoginFirstSection extends StatefulWidget {
  const _LoginFirstSection();

  @override
  State<_LoginFirstSection> createState() => _LoginFirstSectionState();
}

class _LoginFirstSectionState extends State<_LoginFirstSection> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: TColors.loginFormSection,
      child: Column(
        children: [
          const SizedBox(height: 60),
          const SizedBox(height: 100, child: Center(child: _SchoolLogo())),
          const SizedBox(height: 10),
          Text(
            "I do not have an account yet",
            style: AppFonts.loginPageText,
          ),
          const SizedBox(height: 50),
          Text(
            "I am",
            style: AppFonts.loginPageText,
          ),
          const SizedBox(height: 20),
          _SelectionRow(
            selectedIndex: selectedIndex,
            onSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          _buildTextFormField("Username or Email *", icon: Icons.person),
          SizedBox(
            height: 10,
          ),
          _buildTextFormField("Password *", icon: Icons.key),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(TRoutes.dashboard);
              Get.snackbar("Congratulations..", "You are loggedin..");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Background color
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.0), // Adjust the radius as needed
              ),
              alignment: Alignment.centerRight, // Align text to the right
            ),
            child: Text("Login", style: AppFonts.bodyText),
          ),
          SizedBox(
            height: 40,
          ),
          TextButton(
            onPressed: () {
              // Handle forgot password action
            },
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _SchoolLogo extends StatelessWidget {
  const _SchoolLogo();

  @override
  Widget build(BuildContext context) {
    return Image.asset(TImages.schoolLogo);
  }
}

class _SelectionRow extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const _SelectionRow({
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SelectableCircleAvatar(
            label: 'Admin',
            icon: Icons.person_2_rounded,
            isSelected: selectedIndex == 0,
            onTap: () => onSelected(0),
          ),
          SelectableCircleAvatar(
            label: 'Student',
            icon: Icons.group,
            isSelected: selectedIndex == 1,
            onTap: () => onSelected(1),
          ),
          SelectableCircleAvatar(
            label: 'Teacher',
            icon: Icons.person_2,
            isSelected: selectedIndex == 2,
            onTap: () => onSelected(2),
          ),
        ],
      ),
    );
  }
}

Widget _buildTextFormField(String label,
    {int maxLines = 1, required IconData icon}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: SizedBox(
      width: 300,
      child: TextFormField(
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: label,
          fillColor: Colors.grey[50], // Lighter fill color
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
            borderSide: BorderSide(
              // ignore: deprecated_member_use
              color: Colors.grey.withOpacity(0.3),
              //width: 1.0,  // Lighter border color
            ),
          ),
        ),
      ),
    ),
  );
}
