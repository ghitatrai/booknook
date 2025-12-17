import 'package:booknoke/core/error/exceptions.dart';
import 'package:booknoke/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:booknoke/features/auth/data/model/user_model.dart';

/// Mock implementation of the remote data source.
/// This class simulates network delays and responses.
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> login(String email, String password) async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 1));

    if (email == 'test@test.com' && password == 'password') {
      return UserModel(
        id: '1',
        name: 'Test User',
        email: email,
      );
    } else {
      throw ServerException('Invalid credentials');
    }
  }

  @override
  Future<UserModel> signUp(String name, String email, String password) async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 1));

    // In a real app, you would send this data to your server.
    // For this mock, we'll just return a new user model.
    return UserModel(id: '2', name: name, email: email);
  }
}