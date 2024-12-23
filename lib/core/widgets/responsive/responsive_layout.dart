import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileView;
  final Widget tabletView;
  final Widget webView;

  const ResponsiveLayout({
    super.key,
    required this.mobileView,
    required this.tabletView,
    required this.webView,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return mobileView;
        } else if (constraints.maxWidth < 1100) {
          return tabletView;
        } else {
          return webView;
        }
      },
    );
  }
}
