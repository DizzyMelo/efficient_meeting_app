// To parse this JSON data, do
//
//     final getTasksResponse = getTasksResponseFromJson(jsonString);

import 'dart:convert';

import 'package:efficient_meeting_app/core/api/response/response_object.dart';

import '../../../entities/task_entity.dart';

GetTasksResponse getTasksResponseFromJson(String str) =>
    GetTasksResponse.fromJson(json.decode(str));

String getTasksResponseToJson(GetTasksResponse data) =>
    json.encode(data.toJson());

class GetTasksResponse extends ResponseObject {
  GetTasksResponse({
    this.status,
    this.results,
    this.tasks,
  });

  String? status;
  int? results;
  List<Task>? tasks;

  factory GetTasksResponse.fromJson(Map<String, dynamic> json) =>
      GetTasksResponse(
        status: json["status"],
        results: json["results"],
        tasks: List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "results": results,
        "tasks": List<dynamic>.from(tasks!.map((x) => x.toJson())),
      };
}
