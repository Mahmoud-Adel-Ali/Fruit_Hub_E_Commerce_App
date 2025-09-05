import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/widgets/error_dialog.dart';
import '../../cubits/signin_cubit/signin_cubit.dart';
import 'login_view_body.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninFailure) {
          errorDialog(context, msg: state.message);
        } else if (state is SigninSuccess) {
          //TODO : navigate to home view
          //TODO : cache user data in local storage [Hive]
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SigninLoading,
          child: const LoginViewBody(),
        );
      },
    );
  }
}
