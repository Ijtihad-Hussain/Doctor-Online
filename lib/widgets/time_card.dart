import 'package:flutter/material.dart';

import '../utils/colors.dart';

class TimeCard extends StatelessWidget {
  String? time;
  double? height;
  double? width;
  Color? color;

  TimeCard({this.time,this.width,this.height,this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height ?? 25,
        width: width ?? 75,
        decoration: BoxDecoration(
          color: color ?? kLightBlue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            time??'1:00 PM',
            style: const TextStyle(
                fontSize: 10
            ),
          ),
        ),
      ),
    );
  }
}
