import 'package:app/config/errors/failure.dart';
import 'package:app/config/use_cases/use_case.dart';
import 'package:app/features/login/domain/entities/login_data_entity.dart';
import 'package:app/features/login/domain/respositories/login_repository.dart';
import 'package:fpdart/fpdart.dart';

class LoginUseCase implements UseCase<LoginDataEntity, Failure, LoginParams> {
  final LoginRepository loginRepositoryImpl;

  LoginUseCase({required this.loginRepositoryImpl});

  @override
  Future<Either<Failure, LoginDataEntity>> call(LoginParams params) async {
    return await loginRepositoryImpl.login(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });
}
