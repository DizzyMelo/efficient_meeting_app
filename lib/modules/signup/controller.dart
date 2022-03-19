import 'package:get/get.dart';

import '../../core/api/clients/user_client.dart';
import '../../core/api/response/user_reponse_model.dart';
import '../../core/entities/user_entity.dart';
import '../login/binding.dart';
import '../login/view.dart';

class SignupController extends GetxController {
  var loading = false.obs;
  var counter = 0.obs;

  final userClient = UserClient();

  void signup(firstName, lastName, email, phone, password) async {
    loading.value = true;
    UserResponseModel response = await userClient.signup(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        password: password) as UserResponseModel;

    loading.value = false;

    if (response.status == 'success') {
      User.user = response.user;
      Get.to(LoginView(), binding: LoginBiding());
    }
  }
}
