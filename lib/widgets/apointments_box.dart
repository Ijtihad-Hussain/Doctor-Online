import 'package:flutter/material.dart';
import 'package:tele_consult/utils/custom_tex_styles.dart';

import '../utils/colors.dart';

class AppointmentsBox extends StatefulWidget {
  double? height;
  double? width;
  Color? color;
  String? text;
  Icon? icon;

  AppointmentsBox({this.height,this.width,this.color,this.text,this.icon});

  @override
  State<AppointmentsBox> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<AppointmentsBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 140,
      width: widget.width ?? 160,
      decoration: BoxDecoration(
        color: widget.color ?? Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: widget.icon ?? Icon(Icons.pages),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
                widget.text ?? 'Appointments',
            style: CustomTextStyles.boldStyle
            ),
          ),
        ],
      ),
    );
  }
}
