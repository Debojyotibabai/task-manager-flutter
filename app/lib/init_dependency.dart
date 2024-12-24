import 'package:app/features/sign_up/data/data_sources/sign_up_data_data_source.dart';
import 'package:app/features/sign_up/data/repositories/sign_up_repository_impl.dart';
import 'package:app/features/sign_up/domain/repositories/sign_up_repository.dart';
import 'package:app/features/sign_up/domain/use_cases/sign_up_use_case.dart';
import 'package:app/features/sign_up/presentation/bloc/sign_up/sign_up_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void initDependency() {
  _initSignUpDependency();
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
