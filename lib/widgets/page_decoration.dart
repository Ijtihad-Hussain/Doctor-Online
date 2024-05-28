import 'package:flutter/material.dart';

import '../utils/colors.dart';

class PageDecoration {
  static const pageDecoration = BoxDecoration(
  gradient: LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
  kGBlue,
  Colors.white12,
  Colors.white12,
  kBlue,
  ],
  ));
}
