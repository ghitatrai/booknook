// features/auth/domain/usecases/sign_up_usecase.dart
import 'package:booknoke/core/error/failures.dart';
import 'package:booknoke/features/auth/domain/entities/user_entity.dart';
import 'package:booknoke/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecase/usecase.dart';

class SignUpUseCase implements UseCase<User, SignUpParams> {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(SignUpParams params) async {
    return await repository.signUp(params.name, params.email, params.password);
  }
}

class SignUpParams {
  final String name;
  final String email;
  final String password;

  SignUpParams({required this.name, required this.email, required this.password});
}
