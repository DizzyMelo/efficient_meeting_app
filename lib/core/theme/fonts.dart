import 'package:efficient_meeting_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class Fonts {
  static const String light = "Ubuntu-Light";
  static const String regular = "Ubuntu-Regular";
  static const String medium = "Ubuntu-Medium";
  static const String bold = "Ubuntu-Bold";
}

class CustomTextStyles {
  // static TextStyle paragraph = GoogleFonts.lato(color: Colors.grey[900]);
  static final TextStyle button = TextStyle(color: Colors.grey[200]);
  static final TextStyle textMedium = TextStyle(
      color: CustomColors.dark, fontSize: 20, fontFamily: Fonts.regular);
}
