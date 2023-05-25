// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';
import 'package:ptinformatikamediapratama/lib.dart';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int? code;
  Message? message;
  LoginData? data;

  LoginModel({
    this.code,
    this.message,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        code: json["code"],
        message: json["message"] == null
            ? null
            : json["code"] == 200
                ? Message(success: json["message"])
                : Message.fromJson(json["message"]),
        data: json["data"] == null ? null : LoginData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message?.toJson(),
        "data": data?.toJson(),
      };
}

class LoginData {
  int? id;
  String? name;
  dynamic jenisUser;
  String? email;
  String? level;
  String? pathFoto;
  String? accessToken;
  String? tokenType;
  String? expiresIn;
  String? nik;

  LoginData({
    this.id,
    this.name,
    this.jenisUser,
    this.email,
    this.level,
    this.pathFoto,
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.nik,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        id: json["id"],
        name: json["name"],
        jenisUser: json["jenis_user"],
        email: json["email"],
        level: json["level"],
        pathFoto: json["path_foto"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        nik: json["nik"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "jenis_user": jenisUser,
        "email": email,
        "level": level,
        "path_foto": pathFoto,
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "nik": nik,
      };
}
