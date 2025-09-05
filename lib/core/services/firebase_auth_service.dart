import 'dart:developer';

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
      log(
        "Exception in FirebaseAuthService.createUserWithEmailAndPassword :- $e",
      );
      if (e.code == 'weak-password') {
        throw CustomException(
          message: 'كَلِمَةُ اَلْمُرُورِ اَلْمُدْخَلَةِ ضَعِيفَةً جِدًّا.',
        );
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message:
              'يُوجَد حِسَابٌ مُسَجَّلٌ- بِالْفِعْلِ- بِهَذَا اَلْبَرِيدِ اَلْإِلِكْتِرُونِيِّ، اَلرَّجَاءُ تَسْجِيلَ اَلدُّخُولِ.',
        );
      } else if (e.code == "netword-request-failed") {
        throw CustomException(
          message: "تَأَكَّدَ مِنْ اَلِاتِّصَالِ بِالْإِنْتَرْنِت.",
        );
      } else {
        throw CustomException(
          message: 'فَشِلَ إِنْشَاءَ اَلْحِسَابِ، حَاوَلَ مَرَّةً أُخْرَى.',
        );
      }
    } catch (e) {
      log(
        "Exception in FirebaseAuthService.createUserWithEmailAndPassword :- $e",
      );
      throw CustomException(
        message: 'فَشِلَ إِنْشَاءَ اَلْحِسَابِ، حَاوَلَ مَرَّةً أُخْرَى.',
      );
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword :- $e");
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        throw CustomException(
          message: 'الرقم السري او البريد الالكتروني غير صحيح.',
        );
      } else if (e.code == "netword-request-failed") {
        throw CustomException(
          message: "تَأَكَّدَ مِنْ اَلِاتِّصَالِ بِالْإِنْتَرْنِت.",
        );
      } else {
        throw CustomException(
          message: "لقد حدث خطا ما, الرجاء المحاوله مره اخري",
        );
      }
    } catch (e) {
      log(
        "Exception in FirebaseAuthService.createUserWithEmailAndPassword :- $e",
      );
      throw CustomException(
        message: "لقد حدث خطا ما, الرجاء المحاوله مره اخري",
      );
    }
  }
}
