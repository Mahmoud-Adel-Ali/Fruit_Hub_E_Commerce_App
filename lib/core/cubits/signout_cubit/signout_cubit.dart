import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../features/auth/domain/repos/auth_repo.dart';

part 'signout_state.dart';

class SignoutCubit extends Cubit<SignoutState> {
  SignoutCubit(this.authRepo) : super(SignoutInitial());

  final AuthRepo authRepo;

  void signOut() async {
    emit(SignoutLoading());
    final result = await authRepo.signout();
    if (result) {
      emit(SignoutSuccess());
    } else {
      emit(SignoutFailure(message: "Failed to sign out"));
    }
  }
}
