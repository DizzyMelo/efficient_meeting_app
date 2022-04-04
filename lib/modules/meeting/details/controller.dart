import 'package:efficient_meeting_app/core/api/clients/meeting_client.dart';
import 'package:efficient_meeting_app/core/api/response/meeting/detail_meeting_response_model.dart';
import 'package:efficient_meeting_app/core/api/response/meeting/update_meeting_response.dart';
import 'package:efficient_meeting_app/core/enums/default_colors.dart';
import 'package:efficient_meeting_app/core/exceptions/unexpected_exception.dart';
import 'package:efficient_meeting_app/core/utils/general_utils.dart';
import 'package:efficient_meeting_app/providers/meeting_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DetailMeetingController extends GetxController {
  var loading = false.obs;
  var loadingUpdate = false.obs;
  var loadingUpdateStatus = false.obs;
  var counter = 0.obs;
  var meetingResponseModel = DetailMeetingResponseModel().obs;
  var meetingId = ''.obs;

  final meetingClient = MeetingClient();

  getMeeting(String meetingId, {shouldLoad = false}) async {
    if (shouldLoad) loading.value = true;
    try {
      meetingResponseModel.value =
          await meetingClient.getOne(meetingId) as DetailMeetingResponseModel;
    } catch (e) {
      GeneralUtils.showMessage(
          message: 'Something went wrong when trying to add meeting!');
    } finally {
      if (shouldLoad) loading.value = false;
    }
  }

  removeTopicFromMeeting(BuildContext context, String topicId) async {
    loadingUpdate.value = true;
    String meetingId = context.read<MeetingProvider>().selectedMeeting!.id!;
    try {
      UpdateMeetingResponse response = await meetingClient
              .removeTopicFromMeeting(meetingId: meetingId, topicId: topicId)
          as UpdateMeetingResponse;
      if (response.status == 'success') {
        Navigator.pop(context);
        GeneralUtils.showMessage(
          message: response.message!,
          color: DefaultColor.success,
        );
      }
    } on CustomException catch (e) {
      GeneralUtils.showMessage(message: e.detail);
    } finally {
      loadingUpdate.value = false;
    }
  }

  removeParticipantFromMeeting(
      BuildContext context, String participantId) async {
    loadingUpdate.value = true;
    String meetingId = context.read<MeetingProvider>().selectedMeeting!.id!;
    try {
      UpdateMeetingResponse response =
          await meetingClient.removeParticipantFromMeeting(
              meetingId: meetingId,
              participantId: participantId) as UpdateMeetingResponse;
      if (response.status == 'success') {
        Navigator.pop(context);
        GeneralUtils.showMessage(
          message: response.message!,
          color: DefaultColor.success,
        );
      }
    } on CustomException catch (e) {
      GeneralUtils.showMessage(message: e.detail);
    } finally {
      loadingUpdate.value = false;
    }
  }

  updateTopicStatus(
      BuildContext context, String topicId, bool completed) async {
    loadingUpdateStatus.value = true;
    String meetingId = context.read<MeetingProvider>().selectedMeeting!.id!;
    try {
      UpdateMeetingResponse response = await meetingClient.updateTopicStatus(
        meetingId: meetingId,
        topicId: topicId,
        completed: completed,
      ) as UpdateMeetingResponse;
      if (response.status == 'success') {
        Navigator.pop(context);
        GeneralUtils.showMessage(
          message: response.message!,
          color: DefaultColor.success,
        );
      }
    } on CustomException catch (e) {
      GeneralUtils.showMessage(message: e.detail);
    } finally {
      loadingUpdateStatus.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    meetingId.value = Get.arguments['meetingId'];
    getMeeting(meetingId.value, shouldLoad: true);
  }
}
