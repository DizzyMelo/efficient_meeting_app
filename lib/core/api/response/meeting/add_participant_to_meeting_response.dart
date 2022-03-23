// To parse this JSON data, do
//
//     final addParticipantToMeetingResponse = addParticipantToMeetingResponseFromJson(jsonString);

import 'dart:convert';

import 'package:efficient_meeting_app/core/api/response/response_object.dart';

import '../../../entities/meeting_entity.dart';

AddParticipantToMeetingResponse addParticipantToMeetingResponseFromJson(
        String str) =>
    AddParticipantToMeetingResponse.fromJson(json.decode(str));

String addParticipantToMeetingResponseToJson(
        AddParticipantToMeetingResponse data) =>
    json.encode(data.toJson());

class AddParticipantToMeetingResponse extends ResponseObject {
  AddParticipantToMeetingResponse({
    this.status,
    this.message,
    this.meeting,
  });

  String? status;
  String? message;
  Meeting? meeting;

  factory AddParticipantToMeetingResponse.fromJson(Map<String, dynamic> json) =>
      AddParticipantToMeetingResponse(
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
