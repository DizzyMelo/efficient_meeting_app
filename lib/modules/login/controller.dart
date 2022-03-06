import 'package:efficient_meeting_app/core/api/clients/user_client.dart';
import 'package:efficient_meeting_app/core/api/response/login_reponse_model.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var loading = false.obs;
  var counter = 0.obs;

  final userClient = UserClient();
  void login({required String login, required String password}) async {
    loading.value = true;
    LoginResponseModel response = await userClient.login(
        login: login, password: password) as LoginResponseModel;

    loading.value = false;

    if (response.status == 'success') {}
  }

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) return "Email is required";
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) return "Password is required";
    return null;
  }
}
