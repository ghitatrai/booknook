// features/auth/data/models/user_model.dart

import 'package:booknoke/features/auth/domain/entities/user_entity.dart';

class UserModel extends User {
  UserModel({required String id, required String name, required String email})
      : super(id: id, name: name, email: email);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
      };
}
