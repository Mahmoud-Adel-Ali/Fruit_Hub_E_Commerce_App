import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_e_commerce_app/core/widgets/custom_button.dart';

import '../../../../../core/widgets/custom_email_text_form_field.dart';
import '../../../../../core/widgets/custom_password_text_form_field.dart';
import '../../cubits/signin_cubit/signin_cubit.dart';
import 'i_forget_my_password_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  // controllers
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        spacing: 16,
        children: [
          CustomEmailTextFormField(controller: emailController),
          CustomPasswordTextFormField(controller: passwordController),
          IForgetMyPasswordWidget(),
          SizedBox(height: 16),
          CustomButton(
            text: "تسجيل الدخول",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                autovalidateMode = AutovalidateMode.disabled;
                formKey.currentState!.save();
                context.read<SigninCubit>().signIn(
                  email: emailController.text,
                  password: passwordController.text,
                );
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
            },
          ),
        ],
      ),
    );
  }
}
