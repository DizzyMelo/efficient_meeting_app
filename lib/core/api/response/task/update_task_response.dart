// To parse this JSON data, do
//
//     final updateTaskResponse = updateTaskResponseFromJson(jsonString);

import 'dart:convert';

import 'package:efficient_meeting_app/core/api/response/response_object.dart';

import '../../../entities/task_entity.dart';

UpdateTaskResponse updateTaskResponseFromJson(String str) =>
    UpdateTaskResponse.fromJson(json.decode(str));

String updateTaskResponseToJson(UpdateTaskResponse data) =>
    json.encode(data.toJson());

class UpdateTaskResponse extends ResponseObject {
  UpdateTaskResponse({
    this.status,
    this.message,
    this.task,
  });

  String? status;
  String? message;
  Task? task;

  factory UpdateTaskResponse.fromJson(Map<String, dynamic> json) =>
      UpdateTaskResponse(
        status: json["status"],
        message: json["message"],
        task: Task.fromJson(json["task"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "task": task!.toJson(),
      };
}
