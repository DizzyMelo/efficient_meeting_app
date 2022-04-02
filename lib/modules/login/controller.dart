import 'package:efficient_meeting_app/core/api/clients/user_client.dart';
import 'package:efficient_meeting_app/core/api/response/user_reponse_model.dart';
import 'package:efficient_meeting_app/core/utils/general_utils.dart';
import 'package:efficient_meeting_app/modules/home/binding.dart';
import 'package:efficient_meeting_app/modules/home/view.dart';
import 'package:get/get.dart';

import '../../core/entities/user_entity.dart';
import '../../core/exceptions/unexpected_exception.dart';

class LoginController extends GetxController {
  var loading = false.obs;
  var counter = 0.obs;

  final userClient = UserClient();
  void login({required String login, required String password}) async {
    loading.value = true;
    try {
      UserResponseModel response = await userClient.login(
          login: login, password: password) as UserResponseModel;

      if (response.status == 'success') {
        User.user = response.user;
        UserResponseModel.loginResponse = response;
        Get.offAndToNamed('/home');
      }
    } on CustomException catch (ex) {
      GeneralUtils.showMessage(message: ex.detail);
    } finally {
      loading.value = false;
    }
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
