import 'package:app/config/errors/failure.dart';
import 'package:app/config/use_cases/use_case.dart';
import 'package:app/features/add_task/domain/repositories/add_task_repository.dart';
import 'package:fpdart/fpdart.dart';

class AddTaskUseCase implements UseCase<String, Failure, AddTaskParams> {
  final AddTaskRepository addTaskRepositoryImpl;

  AddTaskUseCase({
    required this.addTaskRepositoryImpl,
  });

  @override
  Future<Either<Failure, String>> call(
    AddTaskParams params,
  ) async {
    return await addTaskRepositoryImpl.addTask(
      title: params.title,
      description: params.description,
      hexColor: params.hexColor,
      dueAt: params.dueAt,
    );
  }
}

class AddTaskParams {
  final String title;
  final String description;
  final String hexColor;
  final String dueAt;

  AddTaskParams({
    required this.title,
    required this.description,
    required this.hexColor,
    required this.dueAt,
  });
}
