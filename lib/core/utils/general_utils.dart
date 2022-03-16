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

  static showMessage({required String message}) {
    Get.snackbar('', message);
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
}
