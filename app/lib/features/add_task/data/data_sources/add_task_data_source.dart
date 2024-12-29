import 'dart:developer';

import 'package:app/config/api_service.dart';

abstract class AddTaskDataSource {
  Future<String> addTask({
    required String title,
    required String description,
    required String hexColor,
    required String dueAt,
  });
}

class AddTaskDataSourceImpl implements AddTaskDataSource {
  @override
  Future<String> addTask(
      {required String title,
      required String description,
      required String hexColor,
      required String dueAt}) async {
    try {
      final params = {
        "title": title,
        "description": description,
        "hexColor": hexColor,
        "dueAt": dueAt
      };

      final response = await APIService.instance.request(
        "/tasks",
        DioMethod.post,
        param: params,
        contentType: ContentType.json,
      );

      return "Task added successfully!";
    } catch (err, s) {
      log(err.toString() + s.toString());
      throw err.toString();
    }
  }
}
