import 'package:flutter/material.dart';
import 'package:tele_consult/utils/colors.dart';

import 'button.dart';

class RecordBox extends StatelessWidget {
  double? height;
  double? buttoHeight;
  double? buttonWidth;
  double? width;
  Color? color;
  String? buttonText;
  String? text1;
  String? patientName;

  RecordBox({this.height,this.width,this.color,this.buttoHeight,this.buttonWidth,this.buttonText,this.text1,this.patientName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 100,
      width: width ?? 350,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Button(
              onPressed: (){

              },
              height: buttoHeight ?? 70,
              width: buttonWidth ?? 70,
              buttonText: buttonText ?? '27\nFEB',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(text1 ?? 'Record added by you',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text('Record for $patientName',
                  style: const TextStyle(color: kLightGreen),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
