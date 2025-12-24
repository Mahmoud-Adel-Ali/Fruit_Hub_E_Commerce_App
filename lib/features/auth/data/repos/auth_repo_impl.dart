import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub_e_commerce_app/core/errors/failures.dart';
import 'package:fruit_hub_e_commerce_app/core/services/database_service.dart';
import 'package:fruit_hub_e_commerce_app/features/auth/domain/entities/user_entity.dart';

import '../../../../constants.dart';
import '../../../../core/databases/cach_helper.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/end_points.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/user_model.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.databaseService,
  });

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        name: name,
        email: email,
        password: password,
      );
      var userModel = UserModel.fromFirebaseUser(user);
      var newUser = userModel.copyWith(name: name);
      await addUserData(user: newUser);
      return Right(newUser);
    } on CustomException catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
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
      final userEntity = await getUserData(uId: user.uid);
      await saveUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log("Exception in AuthRepoImpl.signInWithEmailAndPassword :- $e");
      return Left(ServerFailure("لقد حدث خطا ما, الرجاء المحاوله مره اخري"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userModel = UserModel.fromFirebaseUser(user);
      final isUserExist = await databaseService.checkIfDataExists(
        path: EndPoints.isUserExists,
        documentId: user.uid,
      );
      if (isUserExist) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userModel);
      }
      await saveUserData(user: userModel);
      return Right(userModel);
    } catch (e) {
      await deleteUser(user);
      log("Exception in AuthRepoImpl.signInWithGoogle :- $e");
      return Left(ServerFailure("لقد حدث خطا ما, الرجاء المحاوله مره اخري"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userModel = UserModel.fromFirebaseUser(user);
      final isUserExist = await databaseService.checkIfDataExists(
        path: EndPoints.isUserExists,
        documentId: user.uid,
      );
      if (isUserExist) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userModel);
      }
      await saveUserData(user: userModel);
      return Right(userModel);
    } catch (e) {
      await deleteUser(user);
      log("Exception in AuthRepoImpl.signInWithFacebook :- $e");
      return Left(ServerFailure("لقد حدث خطا ما, الرجاء المحاوله مره اخري"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithApple();
      var userModel = UserModel.fromFirebaseUser(user);
      final isUserExist = await databaseService.checkIfDataExists(
        path: EndPoints.isUserExists,
        documentId: user.uid,
      );
      if (isUserExist) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userModel);
      }
      await saveUserData(user: userModel);
      return Right(userModel);
    } catch (e) {
      await deleteUser(user);
      log("Exception in AuthRepoImpl.signInWithApple :- $e");
      return Left(ServerFailure("لقد حدث خطا ما, الرجاء المحاوله مره اخري"));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: EndPoints.addUsersData,
      documentId: user.uId,
      data: UserModel.fromEntity(user).toMap(),
    );
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    final data = await databaseService.getData(
      path: EndPoints.getUsersData,
      documentId: uId,
    );
    return UserModel.fromMap(data);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());

    await getit.get<CacheHelper>().setString(kUserData, jsonData);
  }

  @override
  Future<void> logout() async {
    await firebaseAuthService.signOut();
    await getit.get<CacheHelper>().remove(kUserData);
  }
}
