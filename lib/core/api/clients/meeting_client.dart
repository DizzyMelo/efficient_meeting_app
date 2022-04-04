import 'package:efficient_meeting_app/core/api/api_client.dart';
import 'package:efficient_meeting_app/core/api/response/meeting/update_meeting_response.dart';
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
    try {
      var response = await super.post(
        endpoint: _baseEndpoint,
        body: body,
        serializer: AddMeetingResponseModel.fromJson,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseObject> addParticipantToMeeting({
    required String meetingId,
    required String participantId,
  }) async {
    try {
      var response = await super.post(
        endpoint: "$_baseEndpoint/add-participant/$meetingId/$participantId",
        body: {},
        serializer: UpdateMeetingResponse.fromJson,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseObject> addTopicToMeeting({
    required String meetingId,
    required String topic,
  }) async {
    try {
      var response = await super.post(
        endpoint: "$_baseEndpoint/add-topic/$meetingId",
        body: {"topic": topic},
        serializer: UpdateMeetingResponse.fromJson,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseObject> removeTopicFromMeeting({
    required String meetingId,
    required String topicId,
  }) async {
    try {
      var response = await super.post(
        endpoint: "$_baseEndpoint/remove-topic/$meetingId/$topicId",
        body: {},
        serializer: UpdateMeetingResponse.fromJson,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseObject> removeParticipantFromMeeting({
    required String meetingId,
    required String participantId,
  }) async {
    try {
      var response = await super.post(
        endpoint: "$_baseEndpoint/remove-participant/$meetingId/$participantId",
        body: {},
        serializer: UpdateMeetingResponse.fromJson,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseObject> updateTopicStatus({
    required String meetingId,
    required String topicId,
    required bool completed,
  }) async {
    try {
      var response = await super.post(
        endpoint: "$_baseEndpoint/update-topic/$meetingId/$topicId",
        body: {"completed": completed},
        serializer: UpdateMeetingResponse.fromJson,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
