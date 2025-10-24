import 'dart:convert';

import '../../constants.dart';
import '../../features/auth/data/models/user_model.dart';
import '../../features/auth/domain/entities/user_entity.dart';
import '../databases/cach_helper.dart';
import '../services/service_locator.dart';

// 112. Fetch user data and display user name
UserEntity getUserData() {
  final jsonString = getit.get<CacheHelper>().getString(kUserData);
  return UserModel.fromMap(jsonDecode(jsonString!));
}
