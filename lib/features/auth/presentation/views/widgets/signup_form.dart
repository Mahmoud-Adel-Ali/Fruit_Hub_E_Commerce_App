import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_email_text_form_field.dart';
import '../../../../../core/widgets/custom_name_text_form_field.dart';
import '../../../../../core/widgets/custom_password_text_form_field.dart';
import '../../../../../core/widgets/error_dialog.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';
import 'terms_and_conditions_section.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  // controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        spacing: 16,
        children: [
          CustomNameTextFormField(controller: nameController),
          CustomEmailTextFormField(controller: emailController),
          CustomPasswordTextFormField(controller: passwordController),
          TermsAndConditionsSection(
            onChanged: (value) {
              isTermsAccepted = value;
            },
          ),
          const SizedBox(height: 12),
          CustomButton(
            text: "إنشاء حساب جديد",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                autovalidateMode = AutovalidateMode.disabled;
                formKey.currentState!.save();
                if (isTermsAccepted) {
                  context.read<SignupCubit>().createUserWithEmailAndPassword(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  );
                } else {
                  errorDialog(
                    context,
                    msg: "يجب عليك الموافقه علي الشروط و الاحكام.",
                  );
                }
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
