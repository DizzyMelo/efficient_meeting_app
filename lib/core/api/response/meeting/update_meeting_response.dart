// To parse this JSON data, do
//
//     final UpdateMeetingResponse = addParticipantToMeetingResponseFromJson(jsonString);

import 'dart:convert';

import 'package:efficient_meeting_app/core/api/response/response_object.dart';

import '../../../entities/meeting_entity.dart';

UpdateMeetingResponse updateMeetingResponseFromJson(String str) =>
    UpdateMeetingResponse.fromJson(json.decode(str));

String updateMeetingResponseToJson(UpdateMeetingResponse data) =>
    json.encode(data.toJson());

class UpdateMeetingResponse extends ResponseObject {
  UpdateMeetingResponse({
    this.status,
    this.message,
    this.meeting,
  });

  String? status;
  String? message;
  Meeting? meeting;

  factory UpdateMeetingResponse.fromJson(Map<String, dynamic> json) =>
      UpdateMeetingResponse(
        status: json["status"],
        message: json["message"],
        meeting: Meeting.fromJson(json["meeting"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "meeting": meeting!.toJson(),
      };
}
