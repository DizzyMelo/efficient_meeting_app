import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

class GeneralUtils {
  static showMessage(BuildContext context) {
    showFlash(
      context: context,
      duration: const Duration(seconds: 2),
      builder: (context, controller) {
        return Flash(
          controller: controller,
          // behavior: flashStyle,
          position: FlashPosition.bottom,
          boxShadows: kElevationToShadow[4],
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            content: const Text('This is a basic flash'),
          ),
        );
      },
    );
  }
}
