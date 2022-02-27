import 'package:efficient_meeting_app/modules/login/controller.dart';
import 'package:efficient_meeting_app/modules/signup/controller.dart';
import 'package:get/get.dart';

class SignupBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
