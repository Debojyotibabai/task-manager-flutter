import 'package:app/config/errors/failure.dart';
import 'package:app/features/home/domain/entities/task_data_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<TaskDataEntity>>> getAllTasks();

  Future<Either<Failure, String>> deleteTask({required String id});
}
