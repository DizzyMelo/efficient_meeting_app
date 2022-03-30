import 'package:efficient_meeting_app/core/api/clients/tasks_client.dart';
import 'package:efficient_meeting_app/core/api/response/task/get_tasks_responses.dart';
import 'package:efficient_meeting_app/core/entities/task_entity.dart';
import 'package:efficient_meeting_app/core/exceptions/unexpected_exception.dart';
import 'package:efficient_meeting_app/core/utils/general_utils.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  var loading = false.obs;
  var tasks = List<Task>.from([]).obs;
  var taskClient = TaskClient();

  getTasks() async {
    try {
      loading.value = true;
      GetTasksResponse response = taskClient.getTasks() as GetTasksResponse;

      if (response.status == 'success') {
        tasks.value = response.tasks!;
      }
    } on CustomException catch (ex) {
      GeneralUtils.showMessage(message: ex.detail);
    } finally {
      loading.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTasks();
  }
}
