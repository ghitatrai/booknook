// features/auth/data/datasources/auth_remote_data_source.dart

import 'package:booknoke/features/auth/data/model/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> signUp(String name, String email, String password);
}
