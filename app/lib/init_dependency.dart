import 'package:app/features/add_task/data/data_sources/add_task_data_source.dart';
import 'package:app/features/add_task/data/repositories/add_task_repository_impl.dart';
import 'package:app/features/add_task/domain/repositories/add_task_repository.dart';
import 'package:app/features/add_task/domain/use_cases/add_task_use_case.dart';
import 'package:app/features/add_task/presentation/bloc/add_task/add_task_bloc.dart';
import 'package:app/features/home/data/data_sources/task_data_source.dart';
import 'package:app/features/home/data/repositories/task_repository_impl.dart';
import 'package:app/features/home/domain/repositories/task_repository.dart';
import 'package:app/features/home/domain/user_cases/delete_task_use_case.dart';
import 'package:app/features/home/domain/user_cases/get_all_task_use_case.dart';
import 'package:app/features/home/presentation/bloc/all_task/all_task_bloc.dart';
import 'package:app/features/home/presentation/bloc/delete_task/delete_task_bloc.dart';
import 'package:app/features/login/data/data_sources/login_data_source.dart';
import 'package:app/features/login/data/repositories/login_repository_impl.dart';
import 'package:app/features/login/domain/respositories/login_repository.dart';
import 'package:app/features/login/domain/use_cases/login_use_case.dart';
import 'package:app/features/login/presentation/bloc/login/login_bloc.dart';
import 'package:app/features/sign_up/data/data_sources/sign_up_data_data_source.dart';
import 'package:app/features/sign_up/data/repositories/sign_up_repository_impl.dart';
import 'package:app/features/sign_up/domain/repositories/sign_up_repository.dart';
import 'package:app/features/sign_up/domain/use_cases/sign_up_use_case.dart';
import 'package:app/features/sign_up/presentation/bloc/sign_up/sign_up_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void initDependency() {
  _initSignUpDependency();
  _initLoginDependency();
  _initAddTaskDependency();
  _initTaskDependency();
}

void _initSignUpDependency() {
  getIt
    ..registerFactory<SignUpDataDataSource>(
      () => SignupDataDataSourceImpl(),
    )
    ..registerFactory<SignUpRepository>(
      () => SignUpRepositoryImpl(signUpDataDataSourceImpl: getIt()),
    )
    ..registerFactory(
      () => SignUpUseCase(signUpRepositoryImpl: getIt()),
    )
    ..registerLazySingleton(
      () => SignUpBloc(signUpUseCase: getIt()),
    );
}

void _initLoginDependency() {
  getIt
    ..registerFactory<LoginDataSource>(
      () => LoginDataSourceImpl(),
    )
    ..registerFactory<LoginRepository>(
      () => LoginRepositoryImpl(loginDataSourceImpl: getIt()),
    )
    ..registerFactory(
      () => LoginUseCase(loginRepositoryImpl: getIt()),
    )
    ..registerLazySingleton(
      () => LoginBloc(loginUseCase: getIt()),
    );
}

void _initAddTaskDependency() {
  getIt
    ..registerFactory<AddTaskDataSource>(
      () => AddTaskDataSourceImpl(),
    )
    ..registerFactory<AddTaskRepository>(
      () => AddTaskRepositoryImpl(addTaskDataSourceImpl: getIt()),
    )
    ..registerFactory(
      () => AddTaskUseCase(addTaskRepositoryImpl: getIt()),
    )
    ..registerLazySingleton(
      () => AddTaskBloc(addTaskUseCase: getIt()),
    );
}

void _initTaskDependency() {
  getIt
    ..registerFactory<TaskDataSource>(
      () => TaskDataSourceImpl(),
    )
    ..registerFactory<TaskRepository>(
      () => TaskRepositoryImpl(taskDataSourceImpl: getIt()),
    )
    ..registerFactory(
      () => GetAllTaskUseCase(taskRepositoryImpl: getIt()),
    )
    ..registerLazySingleton(
      () => AllTaskBloc(getAllTaskUseCase: getIt()),
    )
    ..registerFactory(
      () => DeleteTaskUseCase(taskRepositoryImpl: getIt()),
    )
    ..registerLazySingleton(
      () => DeleteTaskBloc(deleteTaskUseCase: getIt()),
    );
}
