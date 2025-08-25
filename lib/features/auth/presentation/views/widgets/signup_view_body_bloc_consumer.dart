import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_e_commerce_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';

import '../login_view.dart';
import 'signup_view_body.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Navigator.of(context).pushReplacementNamed(LoginView.routeName);
        }
      },
      builder: (context, state) {
        return const SignupViewBody();
      },
    );
  }
}
