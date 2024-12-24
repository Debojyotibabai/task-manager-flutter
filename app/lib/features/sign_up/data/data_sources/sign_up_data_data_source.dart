import 'dart:developer';

import 'package:app/config/api_service.dart';

abstract class SignUpDataDataSource {
  Future<String> signup({
    required String name,
    required String email,
    required String password,
  });
}

class SignupDataDataSourceImpl implements SignUpDataDataSource {
  @override
  Future<String> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await APIService.instance.request(
        "/auth/signup",
        DioMethod.post,
        param: {
          "name": name,
          "email": email,
          "password": password,
        },
      );

      log(response.toString());

      return "";
    } catch (err, s) {
      log(err.toString() + s.toString());
      throw err.toString();
    }
  }
}
