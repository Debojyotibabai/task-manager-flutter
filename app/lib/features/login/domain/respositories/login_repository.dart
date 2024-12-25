import 'package:app/config/errors/failure.dart';
import 'package:app/features/login/domain/entities/login_data_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginDataEntity>> login({
    required String email,
    required String password,
  });
}
