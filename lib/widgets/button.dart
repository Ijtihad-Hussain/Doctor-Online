import 'package:flutter/material.dart';

import '../utils/colors.dart';

class Button extends StatelessWidget {
  String? buttonText;
  double? width;
  double? height;
  ValueGetter<void> onPressed;
  Widget? childWidget;
  Color? color;
  Color? textColor;
  bool? isLoading;
  double? fontSize;

  Button(
      {this.buttonText,
      required this.onPressed,
      this.width,
      this.height,
      this.childWidget,
      this.color,
        this.textColor,
        this.fontSize,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: isLoading! ? false : true,
          child: Center(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(color ?? kBlue),
                fixedSize:
                    MaterialStatePropertyAll(Size(width ?? 120, height ?? 10)),
              ),
              onPressed: () {
                onPressed();
              },
              child: childWidget ??
                  Text(
                    buttonText ?? 'Button Text',
                    style: TextStyle(
                      color: textColor ?? Colors.white,
                      fontSize: fontSize ?? 12.0,
                    ),
                  ),
            ),
          ),
        ),
        Visibility(
          visible: isLoading!,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}
