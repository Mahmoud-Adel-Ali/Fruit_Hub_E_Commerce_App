import 'package:firebase_auth/firebase_auth.dart';

import '../errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور المدخلة ضعيفة جدًا.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message:
              'يوجد حساب مسجل بالفعل بهذا البريد الإلكتروني , الرجاء تسجيل الدخول.',
        );
      } else {
        throw CustomException(message: 'فشل إنشاء الحساب , حاول مرة أخرى.');
      }
    } catch (e) {
      throw CustomException(message: 'فشل إنشاء الحساب , حاول مرة أخرى.');
    }
  }
}
