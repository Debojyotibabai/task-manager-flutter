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
