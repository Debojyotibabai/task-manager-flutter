part of 'add_task_bloc.dart';

@immutable
sealed class AddTaskEvent {}

final class AddTask extends AddTaskEvent {
  final String title;
  final String description;
  final String hexColor;
  final String dueAt;

  AddTask({
    required this.title,
    required this.description,
    required this.hexColor,
    required this.dueAt,
  });
}
