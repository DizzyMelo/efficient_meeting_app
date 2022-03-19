import 'package:efficient_meeting_app/core/api/api_client.dart';
import 'package:efficient_meeting_app/core/api/response/meeting/detail_meeting_response_model.dart';

import '../../entities/user_entity.dart';
import '../response/meeting/add_meeting_response_model.dart';
import '../response/meeting/meetings_response_model.dart';
import '../response/response_object.dart';

class MeetingClient extends ApiClient {
  final _baseEndpoint = "meetings";
  Future<ResponseObject> getAll() async {
    var response = await super.get(
        endpoint: _baseEndpoint, serializer: MeetingsResponseModel.fromJson);

    return response;
  }

  Future<ResponseObject> getOne(String meetingId) async {
    var response = await super.get(
        endpoint: '$_baseEndpoint/$meetingId',
        serializer: DetailMeetingResponseModel.fromJson);

    return response;
  }

  Future<ResponseObject> add({
    required String title,
    required String description,
    required String date,
    required String duration,
  }) async {
    Map<dynamic, dynamic> body = {
      "title": title,
      "description": description,
      "date": "2022-03-02 15:00:00",
      "host": User.user!.id,
      "duration": int.parse(duration),
      "topics": []
    };

    var response = await super.post(
      endpoint: _baseEndpoint,
      body: body,
      serializer: AddMeetingResponseModel.fromJson,
    );

    return response;
  }
}
