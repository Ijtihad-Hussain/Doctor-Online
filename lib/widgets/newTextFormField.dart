
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewCustomTextFormField extends StatelessWidget {
  final String? Function(String?)? validate;
  final String? hintText;
  final double? height;
  final double? width;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final InputBorder? border;

  const NewCustomTextFormField({
    Key? key,
    this.validate,
    this.hintText,
    this.height,
    this.width,
    this.controller,
    this.keyboardType,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 46,
      width: width ?? 280,
      child: TextFormField(
        validator: validate,
        decoration: InputDecoration(
          hintText: hintText,
          border: border,
        ),
        controller: controller,
        keyboardType: keyboardType,
      ),
    );
  }
}
