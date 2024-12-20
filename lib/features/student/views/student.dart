import 'package:flutter/material.dart';

class Student extends StatelessWidget {
  const Student({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Center(
          child: Text("Student Page Sections..."),
        ),
      ),
    );
  }
}
