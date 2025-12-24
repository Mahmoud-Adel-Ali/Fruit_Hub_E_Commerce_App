import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/helper_functions/get_user_data.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_email_text_form_field.dart';
import '../../../../../core/widgets/custom_name_text_form_field.dart';
import '../../../../../core/widgets/custom_password_text_form_field.dart';
import '../../../../../core/widgets/toast_helper.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  // controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmNewPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    var user = getUserData();
    nameController.text = user.name;
    emailController.text = user.email;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kHorizontalPadding,
            vertical: 16,
          ),
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('المعلومات الشخصيه', style: AppTextStyles.semiBold16),
              CustomNameTextFormField(controller: nameController),
              EmailField(emailController: emailController),
              SizedBox(),

              Text('تغيير كلمة المرور', style: AppTextStyles.semiBold16),

              CustomPasswordTextFormField(controller: passwordController),
              CustomPasswordTextFormField(
                controller: newPasswordController,
                hintText: 'كلمة المرور الجديده',
              ),
              CustomPasswordTextFormField(
                controller: confirmNewPasswordController,
                hintText: 'تأكيد كلمة المرور الجديده',
              ),

              const SizedBox(height: 128),
              CustomButton(text: 'حفظ التغييرات', onPressed: () {}),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ToastHelper.showErrorToast('لا يمكنك تعديل البريد الالكتروني');
      },
      child: AbsorbPointer(
        absorbing: true,
        child: CustomEmailTextFormField(controller: emailController),
      ),
    );
  }
}
