import 'package:get/get.dart';

import 'controller.dart';

class AddMeetingBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddMeetingController>(() => AddMeetingController());
  }
}
