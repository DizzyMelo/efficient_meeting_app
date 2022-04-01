// To parse this JSON data, do
//
//     final addTaskResponse = addTaskResponseFromJson(jsonString);

import 'dart:convert';

import 'package:efficient_meeting_app/core/api/response/response_object.dart';

import '../../../entities/task_entity.dart';

AddTaskResponse addTaskResponseFromJson(String str) =>
    AddTaskResponse.fromJson(json.decode(str));

String addTaskResponseToJson(AddTaskResponse data) =>
    json.encode(data.toJson());

class AddTaskResponse extends ResponseObject {
  AddTaskResponse({
    this.status,
    this.task,
  });

  String? status;
  Task? task;

  factory AddTaskResponse.fromJson(Map<String, dynamic> json) =>
      AddTaskResponse(
        status: json["status"],
        task: Task.fromJson(json["task"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "task": task == null ? null : task!.toJson(),
      };
}
