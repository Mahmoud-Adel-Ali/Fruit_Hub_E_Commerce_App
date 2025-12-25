import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_e_commerce_app/core/widgets/toast_helper.dart';

import '../../../../../core/services/service_locator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_progress_hub.dart';
import '../../../../auth/domain/repos/auth_repo.dart';
import '../../../../../core/cubits/signout_cubit/signout_cubit.dart';
import '../../../../auth/presentation/views/signin_view.dart';
import 'signout_dialog_buttons.dart';

Future<void> signoutDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => BlocProvider<SignoutCubit>(
      create: (context) => SignoutCubit(getit<AuthRepo>()),
      child: const SignoutDialogBody(),
    ),
  );
}

class SignoutDialogBody extends StatelessWidget {
  const SignoutDialogBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignoutCubit, SignoutState>(
      listener: (context, state) {
        if (state is SignoutSuccess) {
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil(SigninView.routeName, (route) => false);
        } else if (state is SignoutFailure) {
          ToastHelper.showErrorToast(state.message);
        }
      },
      builder: (context, state) => CustomProgressHub(
        isLoading: state is SignoutLoading,
        child: Dialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Close Button
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, size: 22),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'هل ترغب في تسجيل الخروج ؟',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bold19.copyWith(color: AppColors.black),
                ),
                const SizedBox(height: 24),
                SignoutDialogButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
