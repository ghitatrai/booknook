// features/auth/domain/usecases/login_usecase.dart
import 'package:booknoke/core/error/failures.dart';
import 'package:booknoke/core/usecase/usecase.dart';
import 'package:booknoke/features/auth/domain/entities/user_entity.dart';
import 'package:booknoke/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements UseCase<User, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    return await repository.login(params.email, params.password);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
