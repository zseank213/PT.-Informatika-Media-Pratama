// To parse this JSON data, do
//
//     final editFaqModel = editFaqModelFromJson(jsonString);

import 'dart:convert';
import 'package:ptinformatikamediapratama/lib.dart';

EditFaqModel editFaqModelFromJson(String str) => EditFaqModel.fromJson(json.decode(str));

String editFaqModelToJson(EditFaqModel data) => json.encode(data.toJson());

class EditFaqModel {
  int? code;
  String? message;
  EditData? data;

  EditFaqModel({
    this.code,
    this.message,
    this.data,
  });

  factory EditFaqModel.fromJson(Map<String, dynamic> json) => EditFaqModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : EditData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
}

class EditData {
  int? id;
  String? pertanyaan;
  String? jawaban;
  bool? statusPublish;
  DateTime? createdAt;
  DateTime? updatedAt;

  EditData({
    this.id,
    this.pertanyaan,
    this.jawaban,
    this.statusPublish,
    this.createdAt,
    this.updatedAt,
  });

  factory EditData.fromJson(Map<String, dynamic> json) => EditData(
        id: json["id"],
        pertanyaan: json["pertanyaan"],
        jawaban: json["jawaban"],
        statusPublish: json["status_publish"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pertanyaan": pertanyaan,
        "jawaban": jawaban,
        "status_publish": statusPublish,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
