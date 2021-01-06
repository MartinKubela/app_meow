import 'package:flutter/material.dart';

class CatTheme {
  final BorderRadius borderRadius = BorderRadius.circular(8);

  static Color primaryColor = Color(0xff2E5955);
  static Color backgroundColor = Color(0xffF2F2F2);
  static Color accentColor = Color(0xffC5D0D2);
  static Color canvasColor = Colors.transparent;

  static ThemeData style() {
    return ThemeData(
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      accentColor: accentColor,
      canvasColor: canvasColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
