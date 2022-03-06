import 'package:efficient_meeting_app/core/api/api_client.dart';
import 'package:efficient_meeting_app/core/api/response/login_reponse_model.dart';

import '../response/response_object.dart';

class UserClient extends ApiClient {
  final _baseEndpoint = "users";
  Future<ResponseObject> login(
      {required String login, required String password}) async {
    Map<String, dynamic> body = {"email": login, "password": password};
    var response = await super.post(
        endpoint: "$_baseEndpoint/login",
        body: body,
        serializer: LoginResponseModel.fromJson);

    return response;
  }
}
