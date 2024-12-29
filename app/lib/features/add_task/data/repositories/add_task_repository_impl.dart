import 'package:app/config/errors/failure.dart';
import 'package:app/features/add_task/data/data_sources/add_task_data_source.dart';
import 'package:app/features/add_task/domain/repositories/add_task_repository.dart';
import 'package:fpdart/fpdart.dart';

class AddTaskRepositoryImpl implements AddTaskRepository {
  final AddTaskDataSource addTaskDataSourceImpl;

  AddTaskRepositoryImpl({
    required this.addTaskDataSourceImpl,
  });

  @override
  Future<Either<Failure, String>> addTask({
    required String title,
    required String description,
    required String hexColor,
    required String dueAt,
  }) async {
    try {
      final response = await addTaskDataSourceImpl.addTask(
        title: title,
        description: description,
        hexColor: hexColor,
        dueAt: dueAt,
      );

      return right(response);
    } catch (err) {
      return left(Failure(message: err.toString()));
    }
  }
}
