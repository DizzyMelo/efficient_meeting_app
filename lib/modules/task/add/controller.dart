import 'package:efficient_meeting_app/core/api/clients/tasks_client.dart';
import 'package:efficient_meeting_app/core/api/response/task/add_task_response.dart';
import 'package:efficient_meeting_app/core/enums/default_colors.dart';
import 'package:efficient_meeting_app/core/exceptions/unexpected_exception.dart';
import 'package:efficient_meeting_app/core/utils/general_utils.dart';
import 'package:efficient_meeting_app/providers/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../core/entities/user_entity.dart';

class AddTaskController extends GetxController {
  var loading = false.obs;

  var taskClient = TaskClient();

  void requestDateInput(BuildContext context) async {
    DateTime? date = await GeneralUtils.selectDate(context);

    if (date != null) {
      context.read<TaskProvider>().setDateToCompleteTask(date);
    }
  }

  void requestTimeInput(BuildContext context) async {
    TimeOfDay? time = await GeneralUtils.selectTime(context);

    if (time != null) {
      context.read<TaskProvider>().setTimeToCompleteTask(time);
    }
  }

  assignTask(BuildContext context, {required String description}) async {
    if (context.read<TaskProvider>().dateToCompleteTaskStr == "Select Date") {
      GeneralUtils.showMessage(message: "Please, select a date");
      return;
    }
    if (context.read<TaskProvider>().timeToCompleteTaskStr == "Select Time") {
      GeneralUtils.showMessage(message: "Please, select a time");
      return;
    }

    DateTime tempDate = context.read<TaskProvider>().dateToCompleteTask!;
    TimeOfDay tempTime = context.read<TaskProvider>().timeToCompleteTask!;

    DateTime date = DateTime(
      tempDate.year,
      tempDate.month,
      tempDate.day,
      tempTime.hour,
      tempTime.minute,
    );

    Map<String, dynamic> body = {
      "title": "Task assigned by ${User.user!.firstname}",
      "description": description,
      "assignedTo": context.read<TaskProvider>().user!.id,
      "deadLine": date.toIso8601String(),
      "createdBy": User.user!.id
    };

    print(body);

    loading.value = true;
    try {
      AddTaskResponse response =
          await taskClient.assignTask(body) as AddTaskResponse;

      if (response.status == "success") {
        GeneralUtils.showMessage(
            message: "Task assigned successfully!",
            color: DefaultColor.success);
      }
    } on CustomException catch (e) {
      GeneralUtils.showMessage(message: e.detail);
    } finally {
      loading.value = false;
      context.read<TaskProvider>().unsetAll();
    }
  }
}
