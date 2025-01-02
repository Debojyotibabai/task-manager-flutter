import 'package:app/config/errors/failure.dart';
import 'package:app/config/use_cases/use_case.dart';
import 'package:app/features/home/domain/repositories/task_repository.dart';
import 'package:fpdart/fpdart.dart';

class DeleteTaskUseCase implements UseCase<String, Failure, DeleteTaskParams> {
  final TaskRepository taskRepositoryImpl;

  DeleteTaskUseCase({required this.taskRepositoryImpl});

  @override
  Future<Either<Failure, String>> call(DeleteTaskParams params) async {
    return await taskRepositoryImpl.deleteTask(id: params.id);
  }
}

class DeleteTaskParams {
  final String id;

  DeleteTaskParams({required this.id});
}
