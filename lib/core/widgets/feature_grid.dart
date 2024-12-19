import 'package:flutter/material.dart';
import 'package:schoolmgmt/core/constants/app_fonts.dart';
import 'package:schoolmgmt/core/constants/app_texts.dart';
import 'package:schoolmgmt/core/constants/colors.dart';

class FeatureGrid extends StatelessWidget {
  final int crAxisCount;
  const FeatureGrid({super.key, required this.crAxisCount});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: crAxisCount,
      shrinkWrap: true, // Wrap the grid content
      physics:
          NeverScrollableScrollPhysics(), // Adjust the number of columns as needed
      children: [
        FeatureCard(
          icon: Icons.group,
          title: TTexts.titleClassManagement,
          description: TTexts.titleClassManagementDescription,
        ),
        FeatureCard(
          icon: Icons.school,
          title: TTexts.titleInstitutionInfo,
          description: TTexts.titleInstitutionDescription,
        ),
        FeatureCard(
          icon: Icons.closed_caption_disabled_outlined,
          title: TTexts.titleExamsManagement,
          description: TTexts.titleExamManagementDescription,
        ),
        FeatureCard(
          icon: Icons.face,
          title: TTexts.titleAttendanceSystem,
          description: TTexts.titleAttendanceSystemDescription,
        ),
      ],
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: TColors.homePageSecondSection,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48.0,
              color: TColors.appPrimaryColor,
            ),
            SizedBox(height: 16.0),
            Text(
              title,
              style: AppFonts.featureHeader,
            ),
            SizedBox(height: 8.0),
            Text(
              style: AppFonts.bodyText,
              description,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
