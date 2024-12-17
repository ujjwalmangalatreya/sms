import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmgmt/core/constants/app_texts.dart';
import 'package:schoolmgmt/core/constants/colors.dart';
import 'package:schoolmgmt/core/constants/app_fonts.dart';
import 'package:schoolmgmt/core/constants/images.dart';
import 'package:schoolmgmt/core/utils/clipper.dart';
import 'package:schoolmgmt/core/widgets/feature_grid.dart';
import 'package:schoolmgmt/routes/routes.dart';

class WebHomeScreen extends StatelessWidget {
  const WebHomeScreen({super.key});

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
        child: Image.asset(TImages.schoolLogo),
      ),
      backgroundColor: TColors.homePageFirstSection,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => {Get.toNamed(TRoutes.login)},
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
      color: TColors.homePageSecondSection,
      child: ClipPath(
        clipper: CustomShapeClipper(),
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: TColors.homePageFirstSection,
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
                  TTexts.heroSectionText,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: AppFonts.bodyText,
                ),
                const SizedBox(height: 20),
                Image.asset(TImages.mobileLaptop),
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
      color: TColors.homePageFirstSection,
      child: ClipPath(
        clipper: CustomShapeClipper(),
        child: Container(
          color: TColors.homePageSecondSection,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isWideScreen ? 100 : 16),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  TTexts.homePageHeaderText,
                  style: AppFonts.homePageTitle,
                ),
                const SizedBox(height: 10),
                Text(
                  TTexts.featureText,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: AppFonts.bodyText,
                ),
                const SizedBox(height: 30),
                FeatureGrid(crAxisCount: 4,),
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
      color: TColors.homePageFirstSection,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: isWideScreen ? 250 : 16, vertical: 20),
        child: Column(
          children: [
            Text(TTexts.dropUsMessageText, style: AppFonts.homePageTitle),
            Text(TTexts.askQuestionText,
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
              TTexts.contactEmailText,
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
      decoration: BoxDecoration(color: TColors.homePagefooterSection),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Column(
          children: [
            SizedBox(
              height: 170,
              width: 170,
              child: Image.asset(TImages.schoolLogo),
            ),
            SizedBox(
              child: Text(
                TTexts.footerText,
                style: AppFonts.bodyText,
                maxLines: 3,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              TTexts.copyWrightText,
              style: AppFonts.bodyText,
            ),
          ],
        ),
      ]),
    );
  }
}
