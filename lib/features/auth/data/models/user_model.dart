import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub_e_commerce_app/features/auth/domain/entities/user_entity.dart';

import '../../../../core/utils/app_keys.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.uId, required super.email});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      uId: user.uid,
      email: user.email ?? '',
    );
  }

  @override
  Map<String, dynamic> toMap() => {
    AppKeys.name: name,
    AppKeys.uId: uId,
    AppKeys.email: email,
  };

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
    name: map[AppKeys.name] ?? '',
    uId: map[AppKeys.uId] ?? '',
    email: map[AppKeys.email] ?? '',
  );
}
