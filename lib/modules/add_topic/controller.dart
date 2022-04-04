import 'package:efficient_meeting_app/core/api/clients/meeting_client.dart';
import 'package:efficient_meeting_app/core/api/response/meeting/update_meeting_response.dart';
import 'package:efficient_meeting_app/core/enums/default_colors.dart';
import 'package:efficient_meeting_app/core/exceptions/unexpected_exception.dart';
import 'package:efficient_meeting_app/core/utils/general_utils.dart';
import 'package:efficient_meeting_app/providers/meeting_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AddTopicController extends GetxController {
  var loading = false.obs;

  MeetingClient meetingClient = MeetingClient();
  Future addTopic(BuildContext context, {required String topic}) async {
    loading.value = true;

    try {
      UpdateMeetingResponse response = await meetingClient.addTopicToMeeting(
        meetingId: context.read<MeetingProvider>().selectedMeeting!.id!,
        topic: topic,
      ) as UpdateMeetingResponse;

      if (response.status == "success") {
        GeneralUtils.showMessage(
            message: response.message!, color: DefaultColor.success);
      }
    } on CustomException catch (e) {
      GeneralUtils.showMessage(message: e.detail);
    } finally {
      loading.value = false;
    }
  }
}
