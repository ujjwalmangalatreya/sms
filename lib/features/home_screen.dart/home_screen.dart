import 'package:flutter/material.dart';
import 'package:schoolmgmt/core/constants/app_assets.dart';
import 'package:schoolmgmt/core/constants/app_colors.dart';
import 'package:schoolmgmt/core/constants/app_fonts.dart';
import 'package:schoolmgmt/core/utils/clipper.dart';
import 'package:schoolmgmt/core/widgets/feature_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AppAssets.schoolLogo),
          ),
          backgroundColor: AppColors.homePageFirstSection,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () => {}, child: const Text("Login")),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: AppColors.homePageSecondSection,
                child: ClipPath(
                  clipper: CustomShapeClipper(),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: AppColors.homePageFirstSection,
                    ),
                    child: Column(
                      children: [
                        Divider(),
                        // Online School Text
                        Text(
                          "Online School",
                          style: AppFonts.homePageTitle,
                        ),
                        // Management Software Text
                        Text(
                          "Management Software.",
                          style: AppFonts.homePageTitle,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Now you can text
                        Text(
                          "Now you can manage your school, college, or any edicational center with eskool",
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style: AppFonts.bodyText,
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        //Mobile Laptop Image
                        Image.asset(AppAssets.mobileLaptop),
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: AppColors.homePageFirstSection,
                child: ClipPath(
                  clipper: CustomShapeClipper(),
                  child: Container(
                    color: AppColors.homePageSecondSection,
                    width: MediaQuery.sizeOf(context).width,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text("Features Of School Management Software",
                              style: AppFonts.homePageTitle),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(100, 10, 100, 0),
                            child: Text(
                              "eSkooly is a complete and feature-rich school management software for all educational institutes. This school management software is for learning, administration, and management activities in schools, colleges, universities, tuition centers, or training centers. Our free school management system manages everything starting from admission to attendance and exams to result in cards.",
                              textAlign: TextAlign.center,
                              softWrap: true,
                              style: AppFonts.bodyText,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          FeatureGrid(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: AppColors.homePageFirstSection,
                ),
                child: Column(
                  children: [
                    Text(
                      "Drop Us a Line",
                      style: AppFonts.homePageTitle,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
