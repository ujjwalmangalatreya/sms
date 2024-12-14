import 'package:flutter/material.dart';
import 'package:schoolmgmt/components/mobile_layout.dart';
import 'package:schoolmgmt/components/responsive_layout.dart';
import 'package:schoolmgmt/components/web_layout.dart';
import 'package:schoolmgmt/screens/welcome/login_register_button.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        webChild: WebLayout(
          imageWidget: Image.asset(
            "assets/logos/school_logo.png",
            width: 250,
            height: 250,
          ),
          dataWidget:
              const LoginRegisterButtons(), //Lets define separate widget for login & signup buttons
        ),
        mobileChild: MobileLayout(
          imageWidget: Image.asset(
            "assets/logos/school_logo.png", // lets configure assets in pubspec.yaml file
            height: 150,
          ),
          dataWidget: const LoginRegisterButtons(),
        ));
  }
}
