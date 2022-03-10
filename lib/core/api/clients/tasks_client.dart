import 'package:efficient_meeting_app/core/api/api_client.dart';
import 'package:efficient_meeting_app/core/api/response/user_reponse_model.dart';

import '../response/response_object.dart';

class TaskClient extends ApiClient {
  final _baseEndpoint = "tasks";
  Future<ResponseObject> getAll(
      {required String login, required String password}) async {
    var response = await super.get(
      endpoint: "$_baseEndpoint/",
      serializer: UserResponseModel.fromJson,
    );

    return response;
  }
}
