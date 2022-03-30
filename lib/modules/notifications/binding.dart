import 'package:get/get.dart';

import 'controller.dart';

class NotificationBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(() => NotificationController());
  }
}
