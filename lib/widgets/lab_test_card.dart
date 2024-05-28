import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tele_consult/utils/colors.dart';

import 'button.dart';

class LabTestCard extends StatelessWidget {
  double? height;
  double? width;
  Color? color;
  String? text1;
  Image? image;
  ValueGetter<void>? onPressed;

  LabTestCard({this.color,this.width,this.height,this.image,this.onPressed, this.text1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Container(
        height: height ?? 380.h,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: color ?? Colors.grey
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text1 ?? 'Chughtai Lab',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: image ?? Image.asset('assets/images/lab.jpg'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Button(
                childWidget: const Text('Book Now'),
                onPressed: onPressed!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}