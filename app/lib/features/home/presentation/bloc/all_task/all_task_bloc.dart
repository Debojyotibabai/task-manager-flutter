import 'package:app/features/home/domain/entities/task_data_entity.dart';
import 'package:app/features/home/domain/user_cases/get_all_task_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'all_task_event.dart';
part 'all_task_state.dart';

class AllTaskBloc extends Bloc<AllTaskEvent, AllTaskState> {
  final GetAllTaskUseCase getAllTaskUseCase;

  AllTaskBloc({
    required this.getAllTaskUseCase,
  }) : super(AllTaskInitial()) {
    on<GetAllTaskEvent>(
      (event, emit) async {
        emit(AllTaskLoading());

        final response = await getAllTaskUseCase(GetAllTaskParams());

        response.fold(
          (err) => emit(AllTaskError(message: err.message)),
          (res) {
            final filteredTasks = res.where(
              (task) {
                return DateFormat('yyyy-MM-dd').format(task.dueAt!) ==
                    DateFormat('yyyy-MM-dd').format(DateTime.parse(event.date));
              },
            ).toList();

            emit(AllTaskSuccess(tasks: filteredTasks));
          },
        );
      },
    );

    on<UpdateTaskEvent>(
      (event, emit) {
        final filteredTasks = (state as AllTaskSuccess).tasks.where(
          (task) {
            return task.id != event.id;
          },
        ).toList();

        emit(AllTaskSuccess(tasks: filteredTasks));
      },
    );
  }
}
