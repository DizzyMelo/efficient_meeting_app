import 'package:get/get.dart';

import 'controller.dart';

class DetailMeetingBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailMeetingController>(() => DetailMeetingController());
  }
}
