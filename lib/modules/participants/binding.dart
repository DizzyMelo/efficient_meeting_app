import 'package:get/get.dart';

import 'controller.dart';

class AddParticipantBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddParticipantController>(() => AddParticipantController());
  }
}
