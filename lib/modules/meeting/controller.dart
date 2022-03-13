import 'package:efficient_meeting_app/core/api/clients/meeting_client.dart';
import 'package:efficient_meeting_app/core/utils/general_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/api/response/meeting/add_meeting_response_model.dart';
import '../../core/api/response/meeting/meetings_response_model.dart';

class MeetingController extends GetxController {
  var loading = false.obs;
  var counter = 0.obs;
  var meetingsResponseModel = MeetingsResponseModel(meetings: []).obs;

  final meetingClient = MeetingClient();

  void add(BuildContext context, title, description, date, duration) async {
    loading.value = true;
    AddMeetingResponseModel response = await meetingClient.add(
      title: title,
      description: description,
      date: date,
      duration: duration,
    ) as AddMeetingResponseModel;

    loading.value = false;

    if (response.status == 'success') {
      GeneralUtils.showMessage(context, message: 'Meeting added!');
    }
  }

  getAllMeetings(BuildContext context) async {
    loading.value = true;
    try {
      meetingsResponseModel.value =
          await meetingClient.getAll() as MeetingsResponseModel;
    } catch (e) {
      GeneralUtils.showMessage(context,
          message: 'Something went wrong when trying to add meeting!');
    } finally {
      loading.value = false;
    }
  }

  String? defaultTextfieldValidator(String? input) {
    if (input!.isEmpty) return "The field above is required";
    return null;
  }
}
