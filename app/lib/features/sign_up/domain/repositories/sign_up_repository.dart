import 'package:app/config/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class SignUpRepository {
  Future<Either<Failure, String>> signup({
    required String name,
    required String email,
    required String password,
  });
}
