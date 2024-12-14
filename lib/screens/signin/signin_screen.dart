import 'package:flutter/material.dart';
import 'package:schoolmgmt/components/mobile_layout.dart';
import 'package:schoolmgmt/components/responsive_layout.dart';
import 'package:schoolmgmt/components/web_layout.dart';
import 'package:schoolmgmt/screens/signin/login_form.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        webChild: WebLayout(
          imageWidget: Image.asset(
            "assets/logos/school_logo.png",
            width: 150,
          ),
          dataWidget:
              LoginForm(), //Lets create widget for login form & use here
        ),
        mobileChild: MobileLayout(
          imageWidget: Image.asset(
            "assets/logos/school_logo.png",
            width: 75,
          ),
          dataWidget: LoginForm(),
        ));
  }
}
