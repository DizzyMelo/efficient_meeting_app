import 'package:efficient_meeting_app/core/api/api_client.dart';

import '../response/meetings_response_model.dart';
import '../response/response_object.dart';

class MeetingClient extends ApiClient {
  final _baseEndpoint = "meetings";
  Future<ResponseObject> getAll() async {
    var response = await super.get(
        endpoint: _baseEndpoint, serializer: MeetingsResponseModel.fromJson);

    return response;
  }

  Future<ResponseObject> add({
    required String title,
    required String description,
    required String date,
    required String duration,
  }) async {
    Map<dynamic, dynamic> body = {};

    var response = await super.post(
      endpoint: _baseEndpoint,
      body: body,
      serializer: Meeting.fromJson,
    );

    return response;
  }
}
