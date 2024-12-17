import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmgmt/core/constants/colors.dart';
import 'package:schoolmgmt/core/constants/app_fonts.dart';
import 'package:schoolmgmt/core/constants/images.dart';
import 'package:schoolmgmt/core/widgets/login_cirular_avatar.dart';
import 'package:schoolmgmt/features/auth/controllers/auth_controller.dart';

class WebLoginPage extends StatelessWidget {
  const WebLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    final TextEditingController eController = TextEditingController();
    final TextEditingController pController = TextEditingController();

    return Scaffold(
      body: Row(
        children: [
          // First Section
          Expanded(
            child: _LoginFirstSection(
              emailController: eController,
              passwordController: pController,
              authController: authController,
            ),
          ),

          // Second Section
          Expanded(
            child: Container(
              color: TColors.loginSecondSection,
              child: const Center(
                child: Text(
                  'Skool will have more design here.....',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginFirstSection extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final AuthController authController;

  const _LoginFirstSection(
      {required this.emailController,
      required this.passwordController,
      required this.authController});

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
          const SizedBox(height: 30),
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
          _buildTextFormField(
            "Username or Email *",
            icon: Icons.person,
            controller: widget.emailController,
          ),
          SizedBox(
            height: 10,
          ),
          _buildTextFormField("Password *",
              icon: Icons.key, controller: widget.passwordController),
          SizedBox(
            height: 20,
          ),
          Obx(
            () {
              return ElevatedButton(
                onPressed: () {
                  if (!widget.authController.isLoading.value) {
                    widget.authController.login(widget.emailController.text,
                        widget.passwordController.text);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  disabledBackgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                  ),
                  alignment: Alignment.centerRight, // Align text to the right
                ),
                child: widget.authController.isLoading.value
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text("Login", style: AppFonts.bodyText),
              );
            },
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
    {int maxLines = 1,
    required IconData icon,
    required TextEditingController controller}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: SizedBox(
      width: 300,
      child: TextFormField(
        controller: controller,
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
