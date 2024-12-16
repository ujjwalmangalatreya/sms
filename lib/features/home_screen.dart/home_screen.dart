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
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _HeroSection(),
            _FeatureSection(),
            _ContactUsSection(),
            _FooterSection(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(AppAssets.schoolLogo),
      ),
      backgroundColor: AppColors.homePageFirstSection,
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

class _HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      color: AppColors.homePageSecondSection,
      child: ClipPath(
        clipper: CustomShapeClipper(),
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: AppColors.homePageFirstSection,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text("Online School", style: AppFonts.homePageTitle),
                Text("Management Software.", style: AppFonts.homePageTitle),
                const SizedBox(height: 20),
                Text(
                  "Now you can manage your school, college, or any educational center with eSkooly",
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: AppFonts.bodyText,
                ),
                const SizedBox(height: 20),
                Image.asset(AppAssets.mobileLaptop),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FeatureSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 800;

    return Container(
      color: AppColors.homePageFirstSection,
      child: ClipPath(
        clipper: CustomShapeClipper(),
        child: Container(
          color: AppColors.homePageSecondSection,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isWideScreen ? 100 : 16),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  "Features Of School Management Software",
                  style: AppFonts.homePageTitle,
                ),
                const SizedBox(height: 10),
                Text(
                  "eSkooly is a complete and feature-rich school management software for all educational institutes. This school management software is for learning, administration, and management activities in schools, colleges, universities, tuition centers, or training centers. Our free school management system manages everything starting from admission to attendance and exams to result cards.",
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: AppFonts.bodyText,
                ),
                const SizedBox(height: 30),
                FeatureGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactUsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWideScreen = width > 800;

    return Container(
      color: AppColors.homePageFirstSection,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: isWideScreen ? 250 : 16, vertical: 20),
        child: Column(
          children: [
            Text("Drop Us a Line", style: AppFonts.homePageTitle),
            Text("Ask us a question, or just say Hello.",
                style: AppFonts.bodyText),
            const SizedBox(height: 20),
            _ContactForm(),
          ],
        ),
      ),
    );
  }
}

class _ContactForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildTextFormField("First Name *"),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: _buildTextFormField("Last Name *"),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Row(
          children: [
            Expanded(
              child: _buildTextFormField("Email *"),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: _buildTextFormField("Phone"),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        _buildTextFormField("Message *", maxLines: 5),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            // Handle form submission
          },
          child: const Text('Send Message'),
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.email),
            const SizedBox(width: 8.0),
            Text('Contact us by email', style: AppFonts.bodyText),
            const SizedBox(width: 8.0),
            Text(
              'mail@eskooly.com',
              style: AppFonts.bodyText,
            ),
          ],
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

class _FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(color: AppColors.homePagefooterSection),
    );
  }
}
