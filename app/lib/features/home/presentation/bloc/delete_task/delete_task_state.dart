part of 'delete_task_bloc.dart';

@immutable
sealed class DeleteTaskState {}

final class DeleteTaskInitial extends DeleteTaskState {}

final class DeleteTaskLoading extends DeleteTaskState {}

final class DeleteTaskSuccess extends DeleteTaskState {
  final String message;

  DeleteTaskSuccess({required this.message});
}

final class DeleteTaskError extends DeleteTaskState {
  final String message;

  DeleteTaskError({required this.message});
}
