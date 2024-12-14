import 'package:flutter/material.dart';
import 'package:schoolmgmt/components/mobile_layout.dart';
import 'package:schoolmgmt/components/responsive_layout.dart';
import 'package:schoolmgmt/components/rounded_button.dart';
import 'package:schoolmgmt/components/web_layout.dart';
import 'package:schoolmgmt/services/authentication_services.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        webChild: WebLayout(
          imageWidget: Image.asset(
            "assets/images/home.png",
            width: 150,
          ),
          dataWidget:
              const HomeScreenData(), //Lets create this widget to show home screen data
        ),
        mobileChild: MobileLayout(
          imageWidget: Image.asset(
            "assets/images/home.png",
            width: 75,
          ),
          dataWidget: const HomeScreenData(),
        ));
  }
}

class HomeScreenData extends StatelessWidget {
  const HomeScreenData({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Text(
                "Hello",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              Text(
                AuthenticationService().getUserName() ?? "",
                style: const TextStyle(fontSize: 30),
              )
            ],
          ),
          SizedBox(
            width: 100,
            child: RoundedButton(
              label: "Sign Out",
              onPressed: () {
               
              },
            ),
          )
        ],
      ),
    );
  }
}
