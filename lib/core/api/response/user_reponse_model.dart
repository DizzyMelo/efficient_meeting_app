// To parse this JSON data, do
//
//     final userResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:efficient_meeting_app/core/api/response/response_object.dart';

import '../../entities/user_entity.dart';

UserResponseModel userResponseModelFromJson(String str) =>
    UserResponseModel.fromJson(json.decode(str));

String userResponseModelToJson(UserResponseModel data) =>
    json.encode(data.toJson());

class UserResponseModel implements ResponseObject {
  UserResponseModel({
    required this.status,
    required this.token,
    required this.user,
  });

  String status;
  String token;
  User user;

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      UserResponseModel(
        status: json["status"],
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "user": user.toJson(),
      };

  static UserResponseModel? loginResponse;
}
