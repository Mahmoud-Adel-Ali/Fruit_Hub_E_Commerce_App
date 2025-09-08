import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_e_commerce_app/core/widgets/success_dialog.dart';
import 'package:fruit_hub_e_commerce_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/widgets/error_dialog.dart';
import '../signin_view.dart';
import 'signup_view_body.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Navigator.of(context).pushReplacementNamed(SigninView.routeName);
          successDialog(
            context,
            msg:
                " تَمَّ إِنْشَاءَ اَلْحِسَابِ بِنَجَاحٍ، يُمْكِنُكَ اَلْآنَ تَسْجِيلَ اَلدُّخُولِ ",
          );
        } else if (state is SignupFailure) {
          errorDialog(context, msg: state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoading,
          child: const SignupViewBody(),
        );
      },
    );
  }
}
