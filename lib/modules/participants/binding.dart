import 'package:get/get.dart';

import 'controller.dart';

class SignupBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddParticipantController>(() => AddParticipantController());
  }
}
