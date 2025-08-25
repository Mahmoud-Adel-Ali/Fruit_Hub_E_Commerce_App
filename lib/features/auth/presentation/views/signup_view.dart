import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../domain/repos/auth_repo.dart';
import '../cubits/signup_cubit/signup_cubit.dart';
import 'widgets/signup_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(authRepo: getit<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(context, title: 'حساب جديد', showLeading: false),
        body: SignupViewBodyBlocConsumer(),
      ),
    );
  }
}
