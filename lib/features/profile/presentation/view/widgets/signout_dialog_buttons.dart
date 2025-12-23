import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../auth/presentation/cubits/signout_cubit/signout_cubit.dart';

class SignoutDialogButtons extends StatelessWidget {
  const SignoutDialogButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: 'تأكيد',
            color: AppColors.primaryColor,
            onPressed: () {
              context.read<SignoutCubit>().signOut();
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: CustomButton(
            text: 'لا أرغب',
            color: AppColors.white,
            textColor: AppColors.primaryColor,
            borderColor: AppColors.primaryColor,
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }
}
