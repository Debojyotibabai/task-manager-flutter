import 'package:app/config/errors/failure.dart';
import 'package:app/features/home/data/data_sources/task_data_source.dart';
import 'package:app/features/home/data/models/task_data_model.dart';
import 'package:app/features/home/domain/repositories/task_repository.dart';
import 'package:fpdart/fpdart.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskDataSource taskDataSourceImpl;

  TaskRepositoryImpl({
    required this.taskDataSourceImpl,
  });

  @override
  Future<Either<Failure, List<TaskDataModel>>> getAllTasks() async {
    try {
      final response = await taskDataSourceImpl.getAllTasks();
      return right(response);
    } catch (err) {
      return left(Failure(message: err.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteTask({required String id}) async {
    try {
      final response = await taskDataSourceImpl.deleteTask(id: id);
      return right(response);
    } catch (err) {
      return left(Failure(message: err.toString()));
    }
  }
}
