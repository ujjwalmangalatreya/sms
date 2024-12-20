import 'package:flutter/material.dart';

class Employee extends StatelessWidget {
  const Employee({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
        ),
        child: Center(
          child: Text("Employee Page Sections..."),
        ),
      ),
    );
  }
}
