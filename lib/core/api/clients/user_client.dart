import 'package:efficient_meeting_app/core/api/api_client.dart';
import 'package:efficient_meeting_app/core/api/response/get_userbyemail_response.dart';
import 'package:efficient_meeting_app/core/api/response/user_reponse_model.dart';

import '../response/response_object.dart';

class UserClient extends ApiClient {
  final _baseEndpoint = "users";

  Future<ResponseObject> login(
      {required String login, required String password}) async {
    Map<String, dynamic> body = {"email": login, "password": password};
    var response = await super.post(
        endpoint: "$_baseEndpoint/login",
        body: body,
        serializer: UserResponseModel.fromJson);

    return response;
  }

  Future<ResponseObject> signup(
      {required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String password}) async {
    Map<String, dynamic> body = {
      "firstname": firstName,
      "lastname": lastName,
      "email": email,
      "phone": phone,
      "password": password,
      "passwordConfirm": password
    };
    var response = await super.post(
        endpoint: "$_baseEndpoint/signup",
        body: body,
        serializer: UserResponseModel.fromJson);

    return response;
  }

  Future getUserByEmail(String email) async {
    Map<String, String> params = {"email": email};
    var response = await super.get(
        endpoint: _baseEndpoint,
        queryParams: params,
        serializer: GetUserByEmailResponse.fromJson);

    return response;
  }
}
