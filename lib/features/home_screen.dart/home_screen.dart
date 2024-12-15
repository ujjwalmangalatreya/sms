import 'package:flutter/material.dart';
import 'package:schoolmgmt/core/constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: AppColors.appPrimaryColor,
      ),
      child: Center(
        child: Text(
          "This is my Home Page...",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
