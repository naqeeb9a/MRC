// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final int? status;
  final String? message;
  final Data? data;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
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
    required this.studentId,
    required this.leadName,
    required this.email,
    required this.username,
    required this.password,
    required this.mobile,
    required this.phone,
    required this.town,
    required this.city,
    required this.address1,
    required this.fieldOfInterest,
    required this.testName,
    required this.qualification,
    required this.workExperience,
    required this.testScore,
    required this.source,
    required this.find,
    required this.sponsor,
    required this.sponsorProfession,
    required this.leadOrigin,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  final String? studentId;
  final String? leadName;
  final String? email;
  final String? username;
  final String? password;
  final String? mobile;
  final String? phone;
  final dynamic town;
  final dynamic city;
  final dynamic address1;
  final dynamic fieldOfInterest;
  final String? testName;
  final String? qualification;
  final String? workExperience;
  final String? testScore;
  final String? source;
  final String? find;
  final String? sponsor;
  final String? sponsorProfession;
  final String? leadOrigin;
  final String? status;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        studentId: json["student_id"],
        leadName: json["lead_name"],
        email: json["email"],
        username: json["username"],
        password: json["password"],
        mobile: json["mobile"],
        phone: json["phone"],
        town: json["town"],
        city: json["city"],
        address1: json["address1"],
        fieldOfInterest: json["field_of_interest"],
        testName: json["test_name"],
        qualification: json["qualification"],
        workExperience: json["work_experience"],
        testScore: json["test_score"],
        source: json["source"],
        find: json["find"],
        sponsor: json["sponsor"],
        sponsorProfession: json["sponsor_profession"],
        leadOrigin: json["lead_origin"],
        status: json["status"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "student_id": studentId,
        "lead_name": leadName,
        "email": email,
        "username": username,
        "password": password,
        "mobile": mobile,
        "phone": phone,
        "town": town,
        "city": city,
        "address1": address1,
        "field_of_interest": fieldOfInterest,
        "test_name": testName,
        "qualification": qualification,
        "work_experience": workExperience,
        "test_score": testScore,
        "source": source,
        "find": find,
        "sponsor": sponsor,
        "sponsor_profession": sponsorProfession,
        "lead_origin": leadOrigin,
        "status": status,
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "id": id,
      };
}
