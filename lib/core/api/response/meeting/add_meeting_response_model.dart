// To parse this JSON data, do
//
//     final addMeetingResponseModel = addMeetingResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:efficient_meeting_app/core/api/response/response_object.dart';

AddMeetingResponseModel addMeetingResponseModelFromJson(String str) =>
    AddMeetingResponseModel.fromJson(json.decode(str));

String addMeetingResponseModelToJson(AddMeetingResponseModel data) =>
    json.encode(data.toJson());

class AddMeetingResponseModel extends ResponseObject {
  AddMeetingResponseModel({
    this.status,
    this.data,
  });

  String? status;
  Data? data;

  factory AddMeetingResponseModel.fromJson(Map<String, dynamic> json) =>
      AddMeetingResponseModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.title,
    this.description,
    this.date,
    this.host,
    this.duration,
    this.topics,
    this.participants,
    this.status,
    this.id,
    this.v,
  });

  String? title;
  String? description;
  DateTime? date;
  String? host;
  int? duration;
  List<Topic>? topics;
  List<dynamic>? participants;
  String? status;
  String? id;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json["title"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
        host: json["host"],
        duration: json["duration"],
        topics: List<Topic>.from(json["topics"].map((x) => Topic.fromJson(x))),
        participants: List<dynamic>.from(json["participants"].map((x) => x)),
        status: json["status"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "date": date!.toIso8601String(),
        "host": host,
        "duration": duration,
        "topics": List<dynamic>.from(topics!.map((x) => x.toJson())),
        "participants": List<dynamic>.from(participants!.map((x) => x)),
        "status": status,
        "_id": id,
        "__v": v,
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
