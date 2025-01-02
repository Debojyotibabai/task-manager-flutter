import 'dart:convert';
import 'dart:developer';

import 'package:app/config/api_service.dart';
import 'package:app/features/home/data/models/task_data_model.dart';

abstract class TaskDataSource {
  Future<List<TaskDataModel>> getAllTasks();

  Future<String> deleteTask({required String id});
}

class TaskDataSourceImpl implements TaskDataSource {
  @override
  Future<List<TaskDataModel>> getAllTasks() async {
    try {
      final response = await APIService.instance.request(
        "/tasks",
        DioMethod.get,
      );

      final data = taskDataModelFromMap(json.encode(response.data));

      return data;
    } catch (err, s) {
      log(err.toString() + s.toString());

      throw err.toString();
    }
  }

  @override
  Future<String> deleteTask({required String id}) async {
    try {
      final response = await APIService.instance.request(
        "/tasks",
        DioMethod.delete,
        formData: {"taskId": id},
        contentType: ContentType.json,
      );

      return "Task deleted successfully!";
    } catch (err, s) {
      log(err.toString() + s.toString());
      throw err.toString();
    }
  }
}
