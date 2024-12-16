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
            child:
                ElevatedButton(onPressed: () => {}, child: const Text("Login")),
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
                  Text(
                    "Ask us a question, or just say Hello.",
                    style: AppFonts.bodyText,
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.homePageFirstSection,
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(250, 10, 250, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'First Name *',
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Last Name *',
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email *',
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Phone',
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Message *',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        // Handle form submission
                      },
                      child: Text('Send Message'),
                    ),
                    // Add the contact information section here
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.email),
                        SizedBox(width: 8.0),
                        Text('Contact us by email',style: AppFonts.bodyText,),
                        SizedBox(width: 8.0),
                        Text('mail@eskooly.com',
                          style: AppFonts.bodyText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.homePagefooterSection
              ),
            )
          ],
        ),
      ),
    );
  }
}
