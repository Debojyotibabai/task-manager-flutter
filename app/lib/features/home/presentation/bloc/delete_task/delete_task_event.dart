part of 'delete_task_bloc.dart';

@immutable
sealed class DeleteTaskEvent {}

final class DeleteTask extends DeleteTaskEvent {
  final String id;

  DeleteTask({required this.id});
}
