import 'package:efficient_meeting_app/core/api/clients/user_client.dart';
import 'package:efficient_meeting_app/core/utils/general_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/api/response/get_userbyemail_response.dart';
import '../../core/entities/user_entity.dart';

class AddParticipantController extends GetxController {
  var loading = false.obs;
  List<User>? users;

  final userClient = UserClient();
  getUserByEmail({required String email}) async {
    loading.value = true;
    GetUserByEmailResponse response =
        await userClient.getUserByEmail(email) as GetUserByEmailResponse;
    loading.value = false;

    if (response.status == 'success') {
      if (response.users!.isNotEmpty) {
        users = response.users;
      } else {
        GeneralUtils.showMessage(message: 'No user found with this email');
      }
    }
  }
}
