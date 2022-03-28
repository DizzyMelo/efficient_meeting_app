import 'package:efficient_meeting_app/core/enums/default_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GeneralUtils {
  static String formatDate(DateTime? date) {
    if (date == null) {
      return '00-00-0000';
    }

    final DateFormat formatter = DateFormat('MM/dd/yyyy kk:mm');
    final String formatted = formatter.format(date);
    return formatted;
  }

  static String? defaultTextfieldValidator(String? input) {
    if (input!.isEmpty) return "The field above is required";
    return null;
  }

  static showMessage({
    required String message,
    DefaultColor color = DefaultColor.error,
  }) {
    String title = color == DefaultColor.success ? 'Yeah!' : 'Attention!';

    Get.snackbar(
      title,
      message,
      backgroundColor: selectColor(color),
      colorText: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    );
    // showFlash(
    //   context: context,
    //   duration: const Duration(seconds: 2),
    //   builder: (context, controller) {
    //     return Flash(
    //       backgroundColor: CustomColors.accent1,
    //       controller: controller,
    //       behavior: FlashBehavior.floating,
    //       position: FlashPosition.bottom,
    //       boxShadows: kElevationToShadow[4],
    //       horizontalDismissDirection: HorizontalDismissDirection.horizontal,
    //       child: FlashBar(
    //         content: Text(message),
    //       ),
    //     );
    //   },
    // );
  }

  static Color selectColor(DefaultColor color) {
    switch (color) {
      case DefaultColor.success:
        return Colors.green;
      case DefaultColor.error:
        return Colors.red;
      case DefaultColor.info:
        return Colors.blue;
      case DefaultColor.warning:
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }
}
