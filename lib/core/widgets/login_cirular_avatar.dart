import 'package:flutter/material.dart';

class SelectableCircleAvatar extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectableCircleAvatar({
    Key? key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Call parent-provided function
      child: Container(
        width: 90,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey, // Highlight selected
            width: 1.0,
          ),
          color: isSelected
              // ignore: deprecated_member_use
              ? Colors.blue.withOpacity(0.1)
              : Colors.white, // Highlight background
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? Colors.blue
                      : Colors.grey, // Outline for icon
                  width: 2.0,
                ),
              ),
              child: Icon(
                icon,
                size: 30,
                color: isSelected ? Colors.blue : Colors.grey, // Icon color
              ),
            ),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.blue : Colors.grey, // Text color
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
