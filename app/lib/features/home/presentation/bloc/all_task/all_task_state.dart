part of 'all_task_bloc.dart';

@immutable
sealed class AllTaskState {}

final class AllTaskInitial extends AllTaskState {}

final class AllTaskLoading extends AllTaskState {}

final class AllTaskSuccess extends AllTaskState {
  final List<TaskDataEntity> tasks;

  AllTaskSuccess({
    required this.tasks,
  });
}

final class AllTaskError extends AllTaskState {
  final String message;

  AllTaskError({
    required this.message,
  });
}
