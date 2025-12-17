import 'package:booknoke/features/auth/domain/usecase/login_usecase.dart';
import 'package:booknoke/features/auth/domain/usecase/sign_up_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.signUpUseCase,
  }) : super(AuthInitial()) {

    // Handle Login
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      final result = await loginUseCase(
        LoginParams(email: event.email, password: event.password),
      );
      result.fold(
        (failure) => emit(AuthFailure(failure.message)), // requires Failure.message
        (user) => emit(AuthSuccess(user)),
      );
    });

    // Handle SignUp
    on<SignUpRequested>((event, emit) async {
      emit(AuthLoading());
      final result = await signUpUseCase(
        SignUpParams(
          name: event.name,
          email: event.email,
          password: event.password,
        ),
      );
      result.fold(
        (failure) => emit(AuthFailure(failure.message)), // requires Failure.message
        (user) => emit(AuthSuccess(user)),
      );
    });
  }
}
