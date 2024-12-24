import 'package:app/features/sign_up/domain/use_cases/sign_up_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase signUpUseCase;

  SignUpBloc({required this.signUpUseCase}) : super(SignUpInitial()) {
    on<SignUp>((event, emit) async {
      emit(SignUpLoading());

      final response = await signUpUseCase(
        SignUpParams(
          name: event.name,
          email: event.email,
          password: event.password,
        ),
      );

      response.fold(
        (err) => emit(SignUpError(message: err.message)),
        (res) => emit(SignUpSuccess(message: res)),
      );
    });
  }
}
