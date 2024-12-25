import 'package:app/features/login/domain/entities/login_data_entity.dart';
import 'package:app/features/login/domain/use_cases/login_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginInitial()) {
    on<Login>(
      (event, emit) async {
        emit(LoginLoading());

        final response = await loginUseCase(
          LoginParams(
            email: event.email,
            password: event.password,
          ),
        );

        response.fold(
          (err) => emit(LoginError(message: err.message)),
          (res) => emit(LoginSuccess(loginData: res)),
        );
      },
    );
  }
}
