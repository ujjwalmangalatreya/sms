import 'package:flutter/material.dart';

import '../../constants/app_fonts.dart';
import '../../constants/colors.dart';

class DashboardGrid extends StatelessWidget {
  const DashboardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Number of columns
        crossAxisSpacing: 20.0, // Space between columns
        mainAxisSpacing: 20.0, // Space between rows
        childAspectRatio: 1.5, // Width-to-height ratio of each grid item
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        final items = [
          {
            "icon": Icons.person,
            "title": "Total Students",
            "count": "",
            "color": TColors.totalStudentsCardColor
          },
          {
            "icon": Icons.shopping_bag_outlined,
            "title": "Total Employee",
            "count": "",
            "color": TColors.totalEmployeeCardColor
          },
          {
            "icon": Icons.monetization_on_outlined,
            "title": "Total Revenue",
            "count": "",
            "color": TColors.totalRevenueCardColor
          },
          {
            "icon": Icons.monetization_on_outlined,
            "title": "Total Profit",
            "count": "",
            "color": TColors.totalProfitCardColor
          }
        ];

        return DashboardCard(
          icon: items[index]['icon'] as IconData,
          count: items[index]['count'] as String,
          title: items[index]['title'] as String,
          cardColor: items[index]['color'] as Color,
        );
      },
    );
  }
}

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String count;
  final Color cardColor;

  const DashboardCard({
    super.key,
    required this.icon,
    required this.title,
    required this.count,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        semanticContainer: true,
        color: cardColor,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30.0,
                color: TColors.appPrimaryColor,
              ),
              const SizedBox(height: 5.0),
              Text(
                title,
                style: AppFonts.dashboardCardText,
              ),
              const SizedBox(height: 5.0),
              Text(
                "3",
                style: AppFonts.dashboardCardText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
