// To parse this JSON data, do
//
//     final detailMeetingResponseModel = detailMeetingResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:efficient_meeting_app/core/api/response/response_object.dart';
import 'package:efficient_meeting_app/core/entities/user_entity.dart';

DetailMeetingResponseModel detailMeetingResponseModelFromJson(String str) =>
    DetailMeetingResponseModel.fromJson(json.decode(str));

String detailMeetingResponseModelToJson(DetailMeetingResponseModel data) =>
    json.encode(data.toJson());

class DetailMeetingResponseModel extends ResponseObject {
  DetailMeetingResponseModel({
    this.status,
    this.data,
  });

  String? status;
  Data? data;

  factory DetailMeetingResponseModel.fromJson(Map<String, dynamic> json) =>
      DetailMeetingResponseModel(
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
    this.id,
    this.title,
    this.description,
    this.date,
    this.host,
    this.duration,
    this.topics,
    this.participants,
    this.status,
    this.v,
  });

  String? id;
  String? title;
  String? description;
  DateTime? date;
  Host? host;
  int? duration;
  List<Topic>? topics;
  List<User>? participants;
  String? status;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
        host: Host.fromJson(json["host"]),
        duration: json["duration"],
        topics: List<Topic>.from(json["topics"].map((x) => Topic.fromJson(x))),
        participants:
            List<User>.from(json["participants"].map((x) => User.fromJson(x))),
        status: json["status"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "date": date!.toIso8601String(),
        "host": host!.toJson(),
        "duration": duration,
        "topics": List<dynamic>.from(topics!.map((x) => x.toJson())),
        "participants": List<dynamic>.from(participants!.map((x) => x)),
        "status": status,
        "__v": v,
      };
}

class Host {
  Host({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.photo,
    this.phone,
    this.termsAccepted,
    this.status,
    this.stars,
    this.v,
  });

  String? id;
  String? firstname;
  String? lastname;
  String? email;
  String? photo;
  String? phone;
  bool? termsAccepted;
  String? status;
  int? stars;
  int? v;

  factory Host.fromJson(Map<String, dynamic> json) => Host(
        id: json["_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        photo: json["photo"],
        phone: json["phone"],
        termsAccepted: json["termsAccepted"],
        status: json["status"],
        stars: json["stars"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "photo": photo,
        "phone": phone,
        "termsAccepted": termsAccepted,
        "status": status,
        "stars": stars,
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
