import 'package:flutter/material.dart';

class CustomColors {
  static Color primary = const Color.fromRGBO(202, 5, 77, 1);
  static Color secondary = const Color.fromRGBO(59, 28, 50, 1);
  static Color accent1 = const Color.fromRGBO(164, 212, 180, 1);
  static Color accent2 = const Color.fromRGBO(255, 207, 156, 1);
  static Color accent3 = const Color.fromRGBO(185, 109, 64, 1);

  static Map<int, Color> colorCodes = {
    50: const Color.fromRGBO(202, 5, 77, .1),
    100: const Color.fromRGBO(202, 5, 77, .2),
    200: const Color.fromRGBO(202, 5, 77, .3),
    300: const Color.fromRGBO(202, 5, 77, .4),
    400: const Color.fromRGBO(202, 5, 77, .5),
    500: const Color.fromRGBO(202, 5, 77, .6),
    600: const Color.fromRGBO(202, 5, 77, .7),
    700: const Color.fromRGBO(202, 5, 77, .8),
    800: const Color.fromRGBO(202, 5, 77, .9),
    900: const Color.fromRGBO(202, 5, 77, 1),
  };
// Green color code: FF93cd48
  static MaterialColor themeColor = MaterialColor(0xFF5451FB, colorCodes);
}
