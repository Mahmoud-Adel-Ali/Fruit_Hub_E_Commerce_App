import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_e_commerce_app/core/errors/failures.dart';
import 'package:fruit_hub_e_commerce_app/features/auth/domain/entities/user_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/user_model.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await firebaseAuthService.createUserWithEmailAndPassword(
        name: name,
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log("Exception in AuthRepoImpl.createUserWithEmailAndPassword :- $e");
      return Left(ServerFailure("لقد حدث خطا ما, الرجاء المحاوله مره اخري"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log("Exception in AuthRepoImpl.signInWithEmailAndPassword :- $e");
      return Left(ServerFailure("لقد حدث خطا ما, الرجاء المحاوله مره اخري"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final user = await firebaseAuthService.signInWithGoogle();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log("Exception in AuthRepoImpl.signInWithGoogle :- $e");
      return Left(ServerFailure("لقد حدث خطا ما, الرجاء المحاوله مره اخري"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      final user = await firebaseAuthService.signInWithFacebook();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log("Exception in AuthRepoImpl.signInWithFacebook :- $e");
      return Left(ServerFailure("لقد حدث خطا ما, الرجاء المحاوله مره اخري"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    try {
      final user = await firebaseAuthService.signInWithApple();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log("Exception in AuthRepoImpl.signInWithApple :- $e");
      return Left(ServerFailure("لقد حدث خطا ما, الرجاء المحاوله مره اخري"));
    }
  }
}
