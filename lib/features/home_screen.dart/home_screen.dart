import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      child: Center(
        child: Text(
          "This is my Home Page...",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
