import 'package:efficient_meeting_app/login/controller.dart';
import 'package:get/get.dart';

class LoginBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
