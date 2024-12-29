part of 'add_task_bloc.dart';

@immutable
sealed class AddTaskState {}

final class AddTaskInitial extends AddTaskState {}

final class AddTaskLoading extends AddTaskState {}

final class AddTaskSuccess extends AddTaskState {
  final String message;

  AddTaskSuccess({
    required this.message,
  });
}

final class AddTaskError extends AddTaskState {
  final String message;

  AddTaskError({
    required this.message,
  });
}
