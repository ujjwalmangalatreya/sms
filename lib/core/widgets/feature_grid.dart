import 'package:flutter/material.dart';
import 'package:schoolmgmt/core/constants/colors.dart';
import 'package:schoolmgmt/core/constants/app_fonts.dart';

class FeatureGrid extends StatelessWidget {
  const FeatureGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true, // Wrap the grid content
      physics:
          NeverScrollableScrollPhysics(), // Adjust the number of columns as needed
      children: [
        FeatureCard(
          icon: Icons.group,
          title: 'Class Management',
          description:
              'This school management software manage your classes in an easy way. starts from students to subjects, courses to marks.',
        ),
        FeatureCard(
          icon: Icons.school,
          title: 'Institute Info',
          description:
              'You can set your all institute info like logo, name, target line ect, which will display on every printable documents and reports.',
        ),
        FeatureCard(
          icon: Icons.closed_caption_disabled_outlined,
          title: 'Exam Management',
          description:
              'eSkooly has a complete solution for exams management starting from new exam to final result, reports and result cards.' ),
        FeatureCard(
          icon: Icons.face,
          title: 'Attendence System',
          description:
              'Our free school software has outstanding online attendance management system for students and staff.',
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
            Icon(icon, size: 48.0,color: TColors.appPrimaryColor,),
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
