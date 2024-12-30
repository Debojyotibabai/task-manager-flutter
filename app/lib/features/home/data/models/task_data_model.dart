// To parse this JSON data, do
//
//     final taskDataModel = taskDataModelFromMap(jsonString);

import 'dart:convert';

import 'package:app/features/home/domain/entities/task_data_entity.dart';

List<TaskDataModel> taskDataModelFromMap(String str) =>
    List<TaskDataModel>.from(
        json.decode(str).map((x) => TaskDataModel.fromMap(x)));

String taskDataModelToMap(List<TaskDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class TaskDataModel extends TaskDataEntity {
  TaskDataModel({
    required super.id,
    required super.title,
    required super.description,
    required super.hexColor,
    required super.uid,
    required super.dueAt,
    required super.createdAt,
    required super.updatedAt,
  });

  factory TaskDataModel.fromMap(Map<String, dynamic> json) => TaskDataModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        hexColor: json["hexColor"],
        uid: json["uid"],
        dueAt: json["dueAt"] == null ? null : DateTime.parse(json["dueAt"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "hexColor": hexColor,
        "uid": uid,
        "dueAt": dueAt?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
