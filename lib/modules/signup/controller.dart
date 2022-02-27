import 'package:get/get.dart';

class SignupController extends GetxController {
  var loading = false.obs;
  var counter = 0.obs;
  void signup() async {
    loading.value = !loading.value;
  }
}
