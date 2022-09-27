// To parse this JSON data, do
//
//     final universitiesInfoModel = universitiesInfoModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

UniversitiesInfoModel universitiesInfoModelFromJson(String str) =>
    UniversitiesInfoModel.fromJson(json.decode(str));

String universitiesInfoModelToJson(UniversitiesInfoModel data) =>
    json.encode(data.toJson());

class UniversitiesInfoModel {
  UniversitiesInfoModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final int? status;
  final String? message;
  final List<Datum>? data;

  factory UniversitiesInfoModel.fromJson(Map<String, dynamic> json) =>
      UniversitiesInfoModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.ranking,
    required this.country,
    required this.state,
    required this.address,
    required this.website,
    required this.logo,
    required this.banner,
    required this.status,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.courses,
  });

  final int? id;
  final String? name;
  final String? ranking;
  final Country? country;
  final State? state;
  final dynamic address;
  final dynamic website;
  final String? logo;
  final String? banner;
  final Status? status;
  final String? createdBy;
  final String? updatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Course>? courses;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        ranking: json["ranking"],
        country: json["country"] == null
            ? null
            : countryValues.map![json["country"]],
        state: json["state"] == null ? null : stateValues.map![json["state"]],
        address: json["address"],
        website: json["website"],
        logo: json["logo"],
        banner: json["banner"],
        status:
            json["status"] == null ? null : statusValues.map![json["status"]],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        courses: json["courses"] == null
            ? null
            : List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ranking": ranking,
        "country": country == null ? null : countryValues.reverse[country],
        "state": state == null ? null : stateValues.reverse[state],
        "address": address,
        "website": website,
        "logo": logo,
        "banner": banner,
        "status": status == null ? null : statusValues.reverse[status],
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "courses": courses == null
            ? null
            : List<dynamic>.from(courses!.map((x) => x.toJson())),
      };
}

enum Country { USA, CANADA, UK }

final countryValues = EnumValues(
    {"Canada": Country.CANADA, "UK": Country.UK, "USA": Country.USA});

class Course {
  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.cost,
    required this.eligibilityCriteria,
    required this.field,
    required this.type,
    required this.ranking,
    required this.status,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final Field? name;
  final Description? description;
  final String? cost;
  final EligibilityCriteria? eligibilityCriteria;
  final Field? field;
  final dynamic type;
  final dynamic ranking;
  final Status? status;
  final String? createdBy;
  final dynamic updatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        name: json["name"] == null ? null : fieldValues.map![json["name"]],
        description: json["description"] == null
            ? null
            : descriptionValues.map![json["description"]],
        cost: json["cost"],
        eligibilityCriteria: json["eligibility_criteria"] == null
            ? null
            : eligibilityCriteriaValues.map![json["eligibility_criteria"]],
        field: json["field"] == null ? null : fieldValues.map![json["field"]],
        type: json["type"],
        ranking: json["ranking"],
        status:
            json["status"] == null ? null : statusValues.map![json["status"]],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name == null ? null : fieldValues.reverse[name],
        "description":
            description == null ? null : descriptionValues.reverse[description],
        "cost": cost,
        "eligibility_criteria": eligibilityCriteria == null
            ? null
            : eligibilityCriteriaValues.reverse[eligibilityCriteria],
        "field": field == null ? null : fieldValues.reverse[field],
        "type": type,
        "ranking": ranking,
        "status": status == null ? null : statusValues.reverse[status],
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}

enum Description { EMPTY }

final descriptionValues = EnumValues({"-": Description.EMPTY});

enum EligibilityCriteria { NONE }

final eligibilityCriteriaValues =
    EnumValues({"none": EligibilityCriteria.NONE});

enum Field { DATA_SCIENCE, CS, IT }

final fieldValues = EnumValues(
    {"CS": Field.CS, "Data Science": Field.DATA_SCIENCE, "IT": Field.IT});

enum Status { ENABLE }

final statusValues = EnumValues({"Enable": Status.ENABLE});

enum State { EMPTY, CANADA, UK }

final stateValues =
    EnumValues({"canada": State.CANADA, "": State.EMPTY, "UK": State.UK});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
