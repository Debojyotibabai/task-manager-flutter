import 'package:app/config/errors/failure.dart';
import 'package:app/features/login/data/data_sources/login_data_source.dart';
import 'package:app/features/login/data/models/login_data_model.dart';
import 'package:app/features/login/domain/respositories/login_repository.dart';
import 'package:fpdart/fpdart.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource loginDataSourceImpl;

  LoginRepositoryImpl({
    required this.loginDataSourceImpl,
  });

  @override
  Future<Either<Failure, LoginDataModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await loginDataSourceImpl.login(
        email: email,
        password: password,
      );

      return right(response);
    } catch (err) {
      return left(Failure(message: err.toString()));
    }
  }
}
