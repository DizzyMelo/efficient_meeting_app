import 'package:efficient_meeting_app/core/api/clients/meeting_client.dart';
import 'package:efficient_meeting_app/core/api/clients/user_client.dart';
import 'package:efficient_meeting_app/core/api/response/meeting/add_participant_to_meeting_response.dart';
import 'package:efficient_meeting_app/core/enums/default_colors.dart';
import 'package:efficient_meeting_app/core/exceptions/unexpected_exception.dart';
import 'package:efficient_meeting_app/core/utils/general_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/api/response/get_userbyemail_response.dart';
import '../../core/entities/user_entity.dart';

class AddParticipantController extends GetxController {
  var loading = false.obs;
  var loadingParticipant = false.obs;
  List<User>? users;

  final userClient = UserClient();
  final meetingClient = MeetingClient();

  getUserByEmail({required String email}) async {
    loading.value = true;
    GetUserByEmailResponse response =
        await userClient.getUserByEmail(email) as GetUserByEmailResponse;
    loading.value = false;

    if (response.status == 'success') {
      if (response.users!.isNotEmpty) {
        users = response.users;
      } else {
        users = [];
        GeneralUtils.showMessage(message: 'No user found with this email');
      }
    }
  }

  Future addParticipantToMeeting(
      BuildContext context, String meetingId, String participantId) async {
    loadingParticipant.value = true;

    try {
      AddParticipantToMeetingResponse response =
          await meetingClient.addParticipantToMeeting(
              meetingId: meetingId,
              participantId: participantId) as AddParticipantToMeetingResponse;
      loadingParticipant.value = false;

      if (response.status == 'success') {
        Navigator.pop(context);
        GeneralUtils.showMessage(
          message: response.message!,
          color: DefaultColor.success,
        );
      }
    } on CustomException catch (e) {
      Navigator.pop(context);
      GeneralUtils.showMessage(message: e.detail);
    } finally {
      loading.value = false;
    }
  }

  Future<List<User>> getUsersByText({required String email}) async {
    if (email.isEmpty) return [];
    loading.value = true;
    GetUserByEmailResponse response =
        await userClient.getUserByEmail(email) as GetUserByEmailResponse;
    loading.value = false;

    if (response.status == 'success') {
      if (response.users!.isNotEmpty) {
        return response.users!;
      } else {
        return [];
      }
    } else {
      return [];
    }
  }
}
