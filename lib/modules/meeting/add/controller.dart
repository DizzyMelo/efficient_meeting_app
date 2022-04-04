import 'package:efficient_meeting_app/core/api/clients/meeting_client.dart';
import 'package:efficient_meeting_app/core/enums/default_colors.dart';
import 'package:efficient_meeting_app/core/exceptions/unexpected_exception.dart';
import 'package:efficient_meeting_app/core/utils/general_utils.dart';
import 'package:efficient_meeting_app/providers/meeting_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../core/api/response/meeting/add_meeting_response_model.dart';
import '../../../core/api/response/meeting/meetings_response_model.dart';

class AddMeetingController extends GetxController {
  var loading = false.obs;
  var counter = 0.obs;
  var meetingsResponseModel = MeetingsResponseModel(meetings: []).obs;

  final meetingClient = MeetingClient();

  void add(BuildContext context, title, description, duration) async {
    if (context.read<MeetingProvider>().dateToMeetingStr == "Select Date") {
      GeneralUtils.showMessage(message: "Please, select a date");
      return;
    }
    if (context.read<MeetingProvider>().timeToMeetingStr == "Select Time") {
      GeneralUtils.showMessage(message: "Please, select a time");
      return;
    }
    loading.value = true;

    DateTime tempDate = context.read<MeetingProvider>().dateToMeeting!;
    TimeOfDay tempTime = context.read<MeetingProvider>().timeToMeeting!;

    DateTime date = DateTime(
      tempDate.year,
      tempDate.month,
      tempDate.day,
      tempTime.hour,
      tempTime.minute,
    );

    try {
      AddMeetingResponseModel response = await meetingClient.add(
        title: title,
        description: description,
        date: date.toIso8601String(),
        duration: duration,
      ) as AddMeetingResponseModel;

      if (response.status == 'success') {
        GeneralUtils.showMessage(
            message: 'Meeting added!', color: DefaultColor.success);
      }
    } on CustomException catch (e) {
      GeneralUtils.showMessage(message: e.detail);
    } finally {
      loading.value = false;
    }
  }

  getAllMeetings(BuildContext context) async {
    loading.value = true;
    try {
      meetingsResponseModel.value =
          await meetingClient.getAll() as MeetingsResponseModel;
    } catch (e) {
      GeneralUtils.showMessage(
          message: 'Something went wrong when trying to add meeting!');
    } finally {
      loading.value = false;
    }
  }

  String? defaultTextfieldValidator(String? input) {
    if (input!.isEmpty) return "The field above is required";
    return null;
  }

  void requestDateInput(BuildContext context) async {
    DateTime? date = await GeneralUtils.selectDate(context);

    if (date != null) {
      context.read<MeetingProvider>().setDateToMeeting(date);
    }
  }

  void requestTimeInput(BuildContext context) async {
    TimeOfDay? time = await GeneralUtils.selectTime(context);

    if (time != null) {
      context.read<MeetingProvider>().setTimeToMeeting(time);
    }
  }
}
