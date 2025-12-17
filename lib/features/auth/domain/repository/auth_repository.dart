// features/auth/domain/repositories/auth_repository.dart
import 'package:booknoke/core/error/failures.dart';
import 'package:booknoke/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
abstract class AuthRepository {
  Future<Either<Failure, User>> login(String email, String password);
  Future<Either<Failure, User>> signUp(String name, String email, String password);
}
