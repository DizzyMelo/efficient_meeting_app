import 'package:efficient_meeting_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class Fonts {
  static const String light = "RobotoMono-Light";
  static const String regular = "RobotoMono-Regular";
  static const String medium = "RobotoMono-Medium";
  static const String semibold = "RobotoMono-SemiBold";
  static const String bold = "RobotoMono-Bold";

  // Sizes
  static const double smallSize = 14;
  static const double mediumSize = 16;
  static const double largeSize = 20;
}

class CustomTextStyles {
  // static TextStyle paragraph = GoogleFonts.lato(color: Colors.grey[900]);
  static final TextStyle button = TextStyle(
      color: Colors.grey[200],
      fontFamily: Fonts.regular,
      fontSize: Fonts.mediumSize);

  static final TextStyle textSmall = TextStyle(
      color: CustomColors.dark, fontSize: 14, fontFamily: Fonts.regular);

  static const TextStyle textSmallLight =
      TextStyle(color: Colors.white, fontSize: 14, fontFamily: Fonts.regular);

  static final TextStyle textMedium = TextStyle(
      color: CustomColors.dark, fontSize: 16, fontFamily: Fonts.regular);

  static final TextStyle textMediumBold =
      TextStyle(color: CustomColors.dark, fontSize: 16, fontFamily: Fonts.bold);

  static final TextStyle textLargeRegular = TextStyle(
      color: CustomColors.dark, fontSize: 20, fontFamily: Fonts.regular);

  static final TextStyle textTitleRegular = TextStyle(
      color: CustomColors.dark, fontSize: 20, fontFamily: Fonts.regular);

  static final TextStyle textTitleBold =
      TextStyle(color: CustomColors.dark, fontSize: 20, fontFamily: Fonts.bold);
}
