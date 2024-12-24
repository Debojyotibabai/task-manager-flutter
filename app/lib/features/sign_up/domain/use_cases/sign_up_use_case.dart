import 'package:app/config/errors/failure.dart';
import 'package:app/config/use_cases/use_case.dart';
import 'package:app/features/sign_up/domain/repositories/sign_up_repository.dart';
import 'package:fpdart/fpdart.dart';

class SignUpUseCase implements UseCase<String, Failure, SignUpParams> {
  final SignUpRepository signUpRepositoryImpl;

  SignUpUseCase({required this.signUpRepositoryImpl});

  @override
  Future<Either<Failure, String>> call(SignUpParams params) async {
    return await signUpRepositoryImpl.signup(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class SignUpParams {
  final String name;
  final String email;
  final String password;
  SignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
