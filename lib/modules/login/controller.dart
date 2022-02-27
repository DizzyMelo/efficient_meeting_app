import 'package:get/get.dart';

class LoginController extends GetxController {
  var loading = false.obs;
  var counter = 0.obs;
  void login() async {
    loading.value = !loading.value;
  }
}
