import 'package:dartz/dartz.dart';

import 'package:fruit_hub_e_commerce_app/core/errors/failures.dart';

import 'package:fruit_hub_e_commerce_app/features/auth/domain/entities/user_entity.dart';

import '../../domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({required String email, required String password}) {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }
}
