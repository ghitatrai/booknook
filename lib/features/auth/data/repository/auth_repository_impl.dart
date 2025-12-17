// features/auth/data/repositories/auth_repository_impl.dart
import 'package:booknoke/core/error/exceptions.dart';
import 'package:booknoke/core/error/failures.dart';
import 'package:booknoke/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:booknoke/features/auth/domain/entities/user_entity.dart';
import 'package:booknoke/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final user = await remoteDataSource.login(email, password);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> signUp(String name, String email, String password) async {
    try {
      final user = await remoteDataSource.signUp(name, email, password);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
