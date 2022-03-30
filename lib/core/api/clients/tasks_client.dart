import 'package:efficient_meeting_app/core/api/api_client.dart';
import 'package:efficient_meeting_app/core/api/response/task/get_tasks_responses.dart';

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
}
