import 'package:flutter/material.dart';
import 'package:schoolmgmt/core/constants/colors.dart';
import 'package:schoolmgmt/core/constants/app_fonts.dart';
import 'package:schoolmgmt/core/constants/images.dart';
import 'package:schoolmgmt/core/utils/clipper.dart';
import 'package:schoolmgmt/core/widgets/feature_grid.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _HeroSectionMobile(),
            _FeatureSectionMobile(),
            _ContactUsSectionMobile(),
            _FooterSectionMobile(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(TImages.schoolLogo),
      ),
      backgroundColor: TColors.homePageFirstSection,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => {},
            child: const Text("Login"),
          ),
        ),
      ],
    );
  }
}

class _HeroSectionMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: TColors.homePageSecondSection,
      child: ClipPath(
        clipper: CustomShapeClipper(),
        child: Container(
          color: TColors.homePageFirstSection,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Online School", style: AppFonts.homePageTitle),
                Text("Management Software.", style: AppFonts.homePageTitle),
                const SizedBox(height: 20),
                Text(
                  "Now you can manage your school, college, or any educational center with eSkooly",
                  textAlign: TextAlign.center,
                  style: AppFonts.bodyText,
                ),
                const SizedBox(height: 20),
                Image.asset(
                  TImages.mobileLaptop,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FeatureSectionMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: TColors.homePageFirstSection,
      child: ClipPath(
        clipper: CustomShapeClipper(),
        child: Container(
          color: TColors.homePageSecondSection,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Features Of School Management Software",
                  style: AppFonts.homePageTitle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  "eSkooly is a complete and feature-rich school management software for all educational institutes. This school management software is for learning, administration, and management activities in schools, colleges, universities, tuition centers, or training centers.",
                  textAlign: TextAlign.center,
                  style: AppFonts.bodyText,
                ),
                const SizedBox(height: 30),
                FeatureGrid(), // Make sure FeatureGrid is mobile-friendly.
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactUsSectionMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: TColors.homePageFirstSection,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Drop Us a Line",
              style: AppFonts.homePageTitle,
              textAlign: TextAlign.center,
            ),
            Text(
              "Ask us a question, or just say Hello.",
              style: AppFonts.bodyText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _ContactFormMobile(),
          ],
        ),
      ),
    );
  }
}

class _ContactFormMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTextFormField("First Name *"),
        const SizedBox(height: 16.0),
        _buildTextFormField("Last Name *"),
        const SizedBox(height: 16.0),
        _buildTextFormField("Email *"),
        const SizedBox(height: 16.0),
        _buildTextFormField("Phone"),
        const SizedBox(height: 16.0),
        _buildTextFormField("Message *", maxLines: 5),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            // Handle form submission
          },
          child: const Text('Send Message'),
        ),
      ],
    );
  }

  Widget _buildTextFormField(String label, {int maxLines = 1}) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}

class _FooterSectionMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: TColors.homePagefooterSection,
      alignment: Alignment.center,
      child: Text(
        "© 2024 eSkooly - All Rights Reserved",
        style: AppFonts.bodyText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
