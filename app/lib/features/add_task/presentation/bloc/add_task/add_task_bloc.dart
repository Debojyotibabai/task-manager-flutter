import 'package:app/features/add_task/domain/use_cases/add_task_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  final AddTaskUseCase addTaskUseCase;

  AddTaskBloc({
    required this.addTaskUseCase,
  }) : super(AddTaskInitial()) {
    on<AddTask>((event, emit) async {
      emit(AddTaskLoading());

      final response = await addTaskUseCase(
        AddTaskParams(
          title: event.title,
          description: event.description,
          hexColor: event.hexColor,
          dueAt: event.dueAt,
        ),
      );

      response.fold(
        (err) => emit(AddTaskError(message: err.message)),
        (res) => emit(AddTaskSuccess(message: res)),
      );
    });
  }
}
