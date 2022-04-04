import 'package:efficient_meeting_app/core/api/api_client.dart';
import 'package:efficient_meeting_app/core/api/response/task/add_task_response.dart';
import 'package:efficient_meeting_app/core/api/response/task/get_tasks_responses.dart';
import 'package:efficient_meeting_app/core/api/response/task/update_task_response.dart';

import '../response/response_object.dart';

class TaskClient extends ApiClient {
  final _baseEndpoint = "tasks";

  Future<ResponseObject> getTasks() async {
    try {
      var response = await super.get(
        endpoint: "$_baseEndpoint/",
        serializer: GetTasksResponse.fromJson,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseObject> assignTask(Map<String, dynamic> body) async {
    try {
      var response = await super.post(
        endpoint: "$_baseEndpoint/",
        body: body,
        serializer: AddTaskResponse.fromJson,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseObject> updateTaskStatus(String taskId, bool status) async {
    try {
      var response = await super.post(
        endpoint: "$_baseEndpoint/task-status/$taskId",
        body: {"completed": status},
        serializer: UpdateTaskResponse.fromJson,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
