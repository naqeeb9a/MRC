// To parse this JSON data, do
//
//     final leadProgress = leadProgressFromJson(jsonString);

import 'dart:convert';

LeadProgress leadProgressFromJson(String str) =>
    LeadProgress.fromJson(json.decode(str));

String leadProgressToJson(LeadProgress data) => json.encode(data.toJson());

class LeadProgress {
  LeadProgress({
    required this.status,
    required this.message,
    required this.data,
  });

  final int? status;
  final String? message;
  final Data? data;

  factory LeadProgress.fromJson(Map<String, dynamic> json) => LeadProgress(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    required this.status,
    required this.statusName,
  });

  final int? status;
  final String? statusName;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
        statusName: json["status_name"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "status_name": statusName,
      };
}
