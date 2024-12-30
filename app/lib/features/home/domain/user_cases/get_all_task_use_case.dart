import 'package:app/config/errors/failure.dart';
import 'package:app/config/use_cases/use_case.dart';
import 'package:app/features/home/domain/entities/task_data_entity.dart';
import 'package:app/features/home/domain/repositories/task_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllTaskUseCase
    implements UseCase<List<TaskDataEntity>, Failure, GetAllTaskParams> {
  final TaskRepository taskRepositoryImpl;

  GetAllTaskUseCase({
    required this.taskRepositoryImpl,
  });

  @override
  Future<Either<Failure, List<TaskDataEntity>>> call(
      GetAllTaskParams params) async {
    return await taskRepositoryImpl.getAllTasks();
  }
}

class GetAllTaskParams {}
