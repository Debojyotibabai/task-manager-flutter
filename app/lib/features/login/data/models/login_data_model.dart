// To parse this JSON data, do
//
//     final loginDataModel = loginDataModelFromMap(jsonString);

import 'dart:convert';

import 'package:app/features/login/domain/entities/login_data_entity.dart';

LoginDataModel loginDataModelFromMap(String str) =>
    LoginDataModel.fromMap(json.decode(str));

String loginDataModelToMap(LoginDataModel data) => json.encode(data.toMap());

class LoginDataModel extends LoginDataEntity {
  LoginDataModel({
    super.token,
    super.id,
    super.name,
    super.email,
    super.password,
    super.createdAt,
    super.updatedAt,
  });

  factory LoginDataModel.fromMap(Map<String, dynamic> json) => LoginDataModel(
        token: json["token"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "token": token,
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
