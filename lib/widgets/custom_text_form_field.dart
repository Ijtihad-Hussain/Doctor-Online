import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomTextFormField extends StatelessWidget {
  TextInputType? keyBoardType;
  String? hintText;
  IconButton? prefixIcon;
  IconButton? suffixIcon;
  final TextInputAction? inputAction;
  final FocusNode? focusNode;
  Color? color;
  double? height;
  double? width;
  bool? isTextAlignCenter;
  bool? isLoading;
  bool obscureText;
  InputBorder? border;
  TextEditingController? controller;
  String? Function(String?)? validate;
  Widget? prefix;
  int? maxLines;
  final ValueChanged<String>? onChanged;

  CustomTextFormField(
      {super.key,
      this.keyBoardType,
        this.onChanged,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.color,
      this.height,
      this.width,
      this.isTextAlignCenter = false,
      this.obscureText = false,
      this.border,
      this.validate,
      this.controller,
      this.maxLines,
      this.focusNode,
      this.inputAction,
      this.isLoading=false,
      this.prefix,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 46,
      width: width ?? 280,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        // border: Border.all(
        //   color: Colors.black54
        // ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        // focusNode: focusNode,
        validator: validate,
        onChanged: onChanged,
        textAlign: isTextAlignCenter == true ? TextAlign.center : TextAlign.left,
        keyboardType: keyBoardType ?? TextInputType.text,
        textInputAction: inputAction,
        obscureText: obscureText,
        cursorColor: kLightBlue,
        decoration: InputDecoration(
          hintText: hintText ?? 'hint Text',
          prefix: prefix,
          contentPadding: const EdgeInsets.all(12),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: border ?? InputBorder.none,
        ),
      ),
    );
  }
}
