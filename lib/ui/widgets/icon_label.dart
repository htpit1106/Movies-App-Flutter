import 'package:flutter/material.dart';

class IconLabel extends StatelessWidget {
  const IconLabel({
    super.key,
    required this.image,
    required this.color,
    required this.label,
  });
  final String image;
  final Color color;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 4,
      children: [
        Image.asset(image, height: 16, width: 16),
        Text(label, style: TextStyle(fontSize: 12, color: color)),
      ],
    );
  }
}
