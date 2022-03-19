// To parse this JSON data, do
//
//     final getUserByEmailResponse = getUserByEmailResponseFromJson(jsonString);

import 'dart:convert';

import 'package:efficient_meeting_app/core/api/response/response_object.dart';

import '../../entities/user_entity.dart';

GetUserByEmailResponse getUserByEmailResponseFromJson(String str) =>
    GetUserByEmailResponse.fromJson(json.decode(str));

String getUserByEmailResponseToJson(GetUserByEmailResponse data) =>
    json.encode(data.toJson());

class GetUserByEmailResponse extends ResponseObject {
  GetUserByEmailResponse({
    this.status,
    this.results,
    this.users,
  });

  String? status;
  int? results;
  List<User>? users;

  factory GetUserByEmailResponse.fromJson(Map<String, dynamic> json) =>
      GetUserByEmailResponse(
        status: json["status"],
        results: json["results"],
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "results": results,
        "users": List<dynamic>.from(users!.map((x) => x.toJson())),
      };
}
