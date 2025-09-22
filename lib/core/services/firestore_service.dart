import 'package:cloud_firestore/cloud_firestore.dart';

import 'database_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    var collection = firestore.collection(path).doc(documentId);
    await collection.set(data);
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  }) async {
    DocumentSnapshot snapshot = await firestore
        .collection(path)
        .doc(documentId)
        .get();
    return snapshot.data() as Map<String, dynamic>;
  }
}
