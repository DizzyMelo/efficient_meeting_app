import 'package:efficient_meeting_app/core/theme/colors.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

class GeneralUtils {
  static showMessage(BuildContext context, {required String message}) {
    showFlash(
      context: context,
      duration: const Duration(seconds: 2),
      builder: (context, controller) {
        return Flash(
          backgroundColor: CustomColors.accent1,
          controller: controller,
          behavior: FlashBehavior.floating,
          position: FlashPosition.bottom,
          boxShadows: kElevationToShadow[4],
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            content: Text(message),
          ),
        );
      },
    );
  }
}
