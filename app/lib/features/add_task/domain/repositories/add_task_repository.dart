import 'package:app/config/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class AddTaskRepository {
  Future<Either<Failure, String>> addTask({
    required String title,
    required String description,
    required String hexColor,
    required String dueAt,
  });
}
