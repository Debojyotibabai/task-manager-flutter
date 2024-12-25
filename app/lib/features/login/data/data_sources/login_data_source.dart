import 'dart:developer';

import 'package:app/config/api_service.dart';
import 'package:app/features/login/data/models/login_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginDataSource {
  Future<LoginDataModel> login({
    required String email,
    required String password,
  });
}

class LoginDataSourceImpl implements LoginDataSource {
  @override
  Future<LoginDataModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await APIService.instance.request(
        "/auth/login",
        DioMethod.post,
        formData: {
          "email": email,
          "password": password,
        },
        contentType: ContentType.json,
      );

      final data = LoginDataModel.fromMap(response.data);

      final SharedPreferencesAsync prefs = SharedPreferencesAsync();

      await prefs.setString("token", data.token.toString());

      return data;
    } catch (err, s) {
      log(err.toString() + s.toString());
      throw err.toString();
    }
  }
}
