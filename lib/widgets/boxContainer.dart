import 'package:flutter/material.dart';

class BoxContainer extends StatelessWidget {

  String? text;
  Icon? iconLeft;
  Icon? iconRight;
  Color? backgroundColor;
  Color? textColor;
  double? height;
  double? width;

  BoxContainer({this.text,this.iconLeft,this.iconRight,this.backgroundColor,this.textColor,this.width,this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 60,
      width: width ?? 250,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.blueGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: iconLeft,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text ?? 'Text Here',
                style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontSize: 18
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: iconRight
                  // ?? const Icon(Icons.chevron_right)
              ,
            )
          ],
        ),
      ),
    );
  }
}
