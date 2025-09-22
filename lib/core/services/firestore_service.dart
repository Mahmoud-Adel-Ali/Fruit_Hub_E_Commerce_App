import 'package:cloud_firestore/cloud_firestore.dart';

import '../../features/auth/domain/entities/user_entity.dart';
import 'database_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    CollectionReference users = firestore.collection(path);
    await users.add(data);
  }

  @override
  Future<UserEntity> getUserData({
    required String path,
    required String uId,
  }) async {
    DocumentSnapshot snapshot = await firestore.collection(path).doc(uId).get();
    return UserEntity.fromMap(snapshot.data() as Map<String, dynamic>);
  }
}
