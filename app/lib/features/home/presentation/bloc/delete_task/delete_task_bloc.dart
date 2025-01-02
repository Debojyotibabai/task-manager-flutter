import 'package:app/features/home/domain/user_cases/delete_task_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'delete_task_event.dart';
part 'delete_task_state.dart';

class DeleteTaskBloc extends Bloc<DeleteTaskEvent, DeleteTaskState> {
  final DeleteTaskUseCase deleteTaskUseCase;

  DeleteTaskBloc({
    required this.deleteTaskUseCase,
  }) : super(DeleteTaskInitial()) {
    on<DeleteTask>(
      (event, emit) async {
        emit(DeleteTaskLoading());

        final response =
            await deleteTaskUseCase(DeleteTaskParams(id: event.id));

        response.fold(
          (err) => emit(DeleteTaskError(message: err.message)),
          (res) => emit(DeleteTaskSuccess(message: res)),
        );
      },
    );
  }
}
