import 'package:efficient_meeting_app/core/api/clients/meeting_client.dart';
import 'package:efficient_meeting_app/core/api/clients/tasks_client.dart';
import 'package:efficient_meeting_app/core/api/response/task/get_tasks_responses.dart';
import 'package:efficient_meeting_app/core/api/response/task/update_task_response.dart';
import 'package:efficient_meeting_app/core/entities/task_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/api/response/meeting/meetings_response_model.dart';
import '../../core/entities/meeting_entity.dart';
import '../../core/enums/default_colors.dart';
import '../../core/exceptions/unexpected_exception.dart';
import '../../core/utils/general_utils.dart';

class HomeController extends GetxController {
  var loading = false.obs;
  var loadingTasks = false.obs;
  var loadingUpdateTask = false.obs;
  // True shows meetings, false shows tasks
  var showMeeting = true.obs;
  var counter = 0.obs;
  var meetingsResponseModel = MeetingsResponseModel(meetings: []).obs;

  var meetings = List<Meeting>.from([]).obs;
  var tasks = List<Task>.from([]).obs;

  final meetingClient = MeetingClient();
  final taskClient = TaskClient();

  toggleShowMeetingTask(bool isMeeting) {
    if (isMeeting) {
      showMeeting.value = true;
    } else {
      showMeeting.value = false;
    }
  }

  getAllMeetings() async {
    loading.value = true;
    try {
      MeetingsResponseModel response =
          await meetingClient.getAll() as MeetingsResponseModel;
      if (response.status == 'success') {
        meetings.value = response.meetings!;
      }
    } catch (e) {
      // GeneralUtils.showMessage(context,
      //     message: 'Something went wrong while retrieving meetings!');
    } finally {
      loading.value = false;
    }
  }

  getAllTasks({shouldLoad = false}) async {
    if (shouldLoad) loadingTasks.value = true;
    try {
      GetTasksResponse response =
          await taskClient.getTasks() as GetTasksResponse;

      if (response.status == 'success') {
        tasks.value = response.tasks!;
      }
    } catch (e) {
      // GeneralUtils.showMessage(context,
      //     message: 'Something went wrong while retrieving meetings!');
    } finally {
      if (shouldLoad) loadingTasks.value = false;
    }
  }

  updateTaskStatus(BuildContext context, String taskId, bool status) async {
    loadingUpdateTask.value = true;
    try {
      UpdateTaskResponse response = await taskClient.updateTaskStatus(
          taskId, status) as UpdateTaskResponse;

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
      loadingUpdateTask.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();

    getAllMeetings();
    getAllTasks(shouldLoad: true);
  }
}
