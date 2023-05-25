// To parse this JSON data, do
//
//     final listFaqModel = listFaqModelFromJson(jsonString);

import 'dart:convert';
import 'package:expandable/expandable.dart';
import 'package:ptinformatikamediapratama/lib.dart';

ListFaqModel listFaqModelFromJson(String str) => ListFaqModel.fromJson(json.decode(str));

String listFaqModelToJson(ListFaqModel data) => json.encode(data.toJson());

class ListFaqModel {
  int? code;
  String? message;
  List<ListFAQDatum>? data;
  Pagination? pagination;

  ListFaqModel({
    this.code,
    this.message,
    this.data,
    this.pagination,
  });

  factory ListFaqModel.fromJson(Map<String, dynamic> json) => ListFaqModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? [] : List<ListFAQDatum>.from(json["data"]!.map((x) => ListFAQDatum.fromJson(x))),
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };
}

class ListFAQDatum {
  int? id;
  String? pertanyaan;
  String? jawaban;
  int? statusPublish;
  DateTime? createdAt;
  DateTime? updatedAt;
  ExpandableController? controller;

  ListFAQDatum({
    this.id,
    this.pertanyaan,
    this.jawaban,
    this.statusPublish,
    this.createdAt,
    this.updatedAt,
    this.controller,
  });

  factory ListFAQDatum.fromJson(Map<String, dynamic> json) => ListFAQDatum(
        id: json["id"],
        pertanyaan: json["pertanyaan"],
        jawaban: json["jawaban"],
        statusPublish: json["status_publish"],
        controller: json["controller"] as ExpandableController? ?? ExpandableController(),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pertanyaan": pertanyaan,
        "jawaban": jawaban,
        "status_publish": statusPublish,
        "controller": controller,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
