import 'package:flutter/material.dart';
import 'package:schoolmgmt/core/constants/app_fonts.dart';

class HomeScreenTablet extends StatelessWidget {
  const HomeScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "This is my TABLET VIEW",
          style: AppFonts.featureHeader,
        ),
      ),
    );
  }
}
