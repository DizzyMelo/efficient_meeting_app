// To parse this JSON data, do
//
//     final defaultApiErrorResponse = defaultApiErrorResponseFromJson(jsonString);

import 'dart:convert';

DefaultApiErrorResponse defaultApiErrorResponseFromJson(String str) =>
    DefaultApiErrorResponse.fromJson(json.decode(str));

String defaultApiErrorResponseToJson(DefaultApiErrorResponse data) =>
    json.encode(data.toJson());

class DefaultApiErrorResponse {
  DefaultApiErrorResponse({
    this.status,
    this.error,
    this.message,
  });

  String? status;
  Error? error;
  String? message;

  factory DefaultApiErrorResponse.fromJson(Map<String, dynamic> json) =>
      DefaultApiErrorResponse(
        status: json["status"],
        error: Error.fromJson(json["error"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error!.toJson(),
        "message": message,
      };
}

class Error {
  Error({
    this.statusCode,
    this.status,
    this.isOperational,
  });

  int? statusCode;
  String? status;
  bool? isOperational;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        statusCode: json["statusCode"],
        status: json["status"],
        isOperational: json["isOperational"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "status": status,
        "isOperational": isOperational,
      };
}
