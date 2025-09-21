import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../errors/exceptions.dart';

class FirebaseAuthService {
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

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
      if (e.code == 'user-not-found' ||
          e.code == 'wrong-password' ||
          e.code == 'invalid-credential') {
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

  Future<void> signOut() async => await FirebaseAuth.instance.signOut();

  Future<User> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn.instance;

    googleSignIn.initialize(
      serverClientId:
          "485605032271-trjho3ue285k2gm077j6bm3kuqaue1ei.apps.googleusercontent.com",
    );
    final GoogleSignInAccount googleUser = await googleSignIn.authenticate();

    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      // accessToken: googleAuth?.accessToken,
      accessToken: googleAuth.idToken,
      idToken: googleAuth.idToken,
    );

    var userCredential = await FirebaseAuth.instance.signInWithCredential(
      credential,
    );
    return userCredential.user!;
  }

  Future<User> signInWithFacebook() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);
    final LoginResult loginResult = await FacebookAuth.instance.login(
      loginTracking: LoginTracking.limited,
      nonce: nonce,
    );

    // Create a credential from the access token
    OAuthCredential facebookAuthCredential;

    log("tokenType${loginResult.accessToken!.type}");

    if (Platform.isIOS) {
      switch (loginResult.accessToken!.type) {
        case AccessTokenType.classic:
          final token = loginResult.accessToken as ClassicToken;
          facebookAuthCredential = FacebookAuthProvider.credential(
            token.authenticationToken!,
          );
          break;
        case AccessTokenType.limited:
          final token = loginResult.accessToken as LimitedToken;
          facebookAuthCredential = OAuthCredential(
            providerId: 'facebook.com',
            signInMethod: 'oauth',
            idToken: token.tokenString,
            rawNonce: rawNonce,
          );
          break;
      }
    } else {
      facebookAuthCredential = FacebookAuthProvider.credential(
        loginResult.accessToken!.tokenString,
      );
    }
    final signInWithCredential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
    return signInWithCredential.user!;
  }

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<User> signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider(
      "apple.com",
    ).credential(idToken: appleCredential.identityToken, rawNonce: rawNonce);

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    final userCredential = await FirebaseAuth.instance.signInWithCredential(
      oauthCredential,
    );
    return userCredential.user!;
  }
}
