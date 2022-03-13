import 'package:get/get.dart';

import 'controller.dart';

class MeetingBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MeetingController>(() => MeetingController());
  }
}
