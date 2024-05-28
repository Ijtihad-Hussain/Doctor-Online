import 'package:flutter/material.dart';

class FirstLetterAvatar extends StatelessWidget {
  final String text;
  final double radius;
  final Color backgroundColor;
  final Color textColor;

  FirstLetterAvatar({
    required this.text,
    this.radius = 32,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      child: Text(
        text.substring(0, 1).toUpperCase(),
        style: TextStyle(color: textColor, fontSize: radius * 0.4),
      ),
    );
  }
}
