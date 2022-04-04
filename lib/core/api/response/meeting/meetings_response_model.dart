// To parse this JSON data, do
//
//     final meetingsResponseModel = meetingsResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:efficient_meeting_app/core/api/response/response_object.dart';

import '../../../entities/meeting_entity.dart';

MeetingsResponseModel meetingsResponseModelFromJson(String str) =>
    MeetingsResponseModel.fromJson(json.decode(str));

String meetingsResponseModelToJson(MeetingsResponseModel data) =>
    json.encode(data.toJson());

class MeetingsResponseModel extends ResponseObject {
  MeetingsResponseModel({
    this.status,
    this.results,
    this.meetings,
  });

  String? status;
  int? results;
  List<Meeting>? meetings;

  factory MeetingsResponseModel.fromJson(Map<String, dynamic> json) =>
      MeetingsResponseModel(
        status: json["status"],
        results: json["results"],
        meetings: List<Meeting>.from(
            json["meetings"].map((x) => Meeting.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "results": results,
        "meetings": List<dynamic>.from(meetings!.map((x) => x.toJson())),
      };
}
