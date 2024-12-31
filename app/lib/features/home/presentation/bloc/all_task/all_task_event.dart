part of 'all_task_bloc.dart';

@immutable
sealed class AllTaskEvent {}

final class GetAllTaskEvent extends AllTaskEvent {
  final String date;

  GetAllTaskEvent({
    required this.date,
  });
}