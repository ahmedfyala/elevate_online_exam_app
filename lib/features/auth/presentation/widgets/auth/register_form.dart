import 'package:elevate_online_exam_app/core/helpers/validations.dart';
import 'package:elevate_online_exam_app/core/routing/routes.dart';
import 'package:elevate_online_exam_app/core/widgets/custom_auth_button.dart';
import 'package:elevate_online_exam_app/core/widgets/custom_text_form_feild.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/widgets/auth/no_account_row.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({
    super.key,
    required this.onPressed,
    required this.usernameController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneNumberController,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;
  final void Function() onPressed;
  final TextEditingController usernameController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomTextFormField(
                labelText: 'User name',
                hintText: 'Enter your user name',
                controller: usernameController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  return Validations.validateUsername(context, value);
                },
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      labelText: 'First name',
                      hintText: 'Enter first name',
                      controller: firstNameController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        return Validations.validateName(context, value);
                      },
                    ),
                  ),
                  const SizedBox(width: 17),
                  Expanded(
                    child: CustomTextFormField(
                      labelText: 'Last name',
                      hintText: 'Enter last name',
                      controller: lastNameController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        return Validations.validateName(context, value);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              CustomTextFormField(
                labelText: 'Email',
                hintText: 'Enter your email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  return Validations.validateEmail(context, value);
                },
              ),
              const SizedBox(height: 24),
              CustomTextFormField(
                labelText: 'Password',
                hintText: 'Enter password',
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  return Validations.validatePassword(context, value);
                },
              ),
              const SizedBox(height: 24),
              CustomTextFormField(
                labelText: 'Confirm password',
                hintText: 'Confirm password',
                controller: confirmPasswordController,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  return Validations.validateConfirmPassword(
                      context, passwordController.text, value);
                },
              ),
              const SizedBox(height: 24),
              CustomTextFormField(
                labelText: 'Phone number',
                hintText: 'Enter phone number',
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '🔴Phone number is required!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 48),
              CustomAuthButton(
                text: 'Signup',
                onPressed: () {
                  print('Signup button pressed');
                  onPressed();
                },
              ),
              const SizedBox(height: 16),
              NoAccountRow(
                  content: 'Already have an account',
                  actionText: 'Login',
                  onPressed: () {
                    context.go(Routes.loginScreen);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
