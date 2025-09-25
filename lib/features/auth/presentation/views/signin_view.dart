import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';
import 'widgets/custom_auth_app_bar.dart';
import '../../domain/repos/auth_repo.dart';
import '../cubits/signin_cubit/signin_cubit.dart';
import 'widgets/signin_view_body_bloc_consumer.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  static const String routeName = 'signin';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(authRepo: getit<AuthRepo>()),
      child: Scaffold(
        appBar: customAuthAppBar(
          context,
          title: 'تسجيل دخول',
          showLeading: false,
        ),
        body: const SigninViewBodyBlocConsumer(),
      ),
    );
  }
}
