import 'package:app/config/errors/failure.dart';
import 'package:app/features/sign_up/data/data_sources/sign_up_data_data_source.dart';
import 'package:app/features/sign_up/domain/repositories/sign_up_repository.dart';
import 'package:fpdart/fpdart.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpDataDataSource signUpDataDataSourceImpl;

  SignUpRepositoryImpl({required this.signUpDataDataSourceImpl});

  @override
  Future<Either<Failure, String>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await signUpDataDataSourceImpl.signup(
        name: name,
        email: email,
        password: password,
      );

      return right(response);
    } catch (err) {
      return left(Failure(message: err.toString()));
    }
  }
}
