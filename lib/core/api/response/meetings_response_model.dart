// To parse this JSON data, do
//
//     final meetingsResponseModel = meetingsResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:efficient_meeting_app/core/api/response/response_object.dart';

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

class Meeting extends ResponseObject {
  Meeting({
    this.id,
    this.title,
    this.description,
    this.date,
    this.host,
    this.duration,
    this.topics,
    this.participants,
    this.status,
  });

  String? id;
  String? title;
  String? description;
  DateTime? date;
  String? host;
  int? duration;
  List<Topic>? topics;
  List<dynamic>? participants;
  String? status;

  factory Meeting.fromJson(Map<String, dynamic> json) => Meeting(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
        host: json["host"],
        duration: json["duration"],
        topics: List<Topic>.from(json["topics"].map((x) => Topic.fromJson(x))),
        participants: List<dynamic>.from(json["participants"].map((x) => x)),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "date": date!.toIso8601String(),
        "host": host,
        "duration": duration,
        "topics": List<dynamic>.from(topics!.map((x) => x.toJson())),
        "participants": List<dynamic>.from(participants!.map((x) => x)),
        "status": status,
      };
}

class Topic {
  Topic({
    this.name,
    this.completed,
    this.id,
  });

  String? name;
  bool? completed;
  String? id;

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        name: json["name"],
        completed: json["completed"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "completed": completed,
        "_id": id,
      };
}
