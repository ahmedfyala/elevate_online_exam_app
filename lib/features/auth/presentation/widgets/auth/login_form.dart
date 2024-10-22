import 'package:elevate_online_exam_app/core/helpers/validations.dart';
import 'package:elevate_online_exam_app/core/widgets/custom_auth_button.dart';
import 'package:elevate_online_exam_app/core/widgets/custom_text_form_feild.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/widgets/auth/no_account_row.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/routes.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.emailController,
    required this.formKey,
    required this.passwordController,
    required this.onChanged,
    required this.color,
    this.showPassword,
    this.isPasswordVisible,
    required this.goToHome,
    required this.goToRegister,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final void Function() onChanged;
  final Color color;
  final void Function()? showPassword;
  final bool? isPasswordVisible;
  final void Function()? goToHome;
  final void Function()? goToRegister;

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: onChanged,
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextFormField(
                labelText: 'Email',
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                validator: (value) {
                  return Validations.validateEmail(context, value);
                }),
            const SizedBox(height: 24),
            CustomTextFormField(
                isPasswordVisible: isPasswordVisible!,
                showPassword: showPassword,
                labelText: 'Password',
                hintText: 'Enter your password',
                keyboardType: TextInputType.text,
                controller: passwordController,
                validator: (value) {
                  return Validations.validatePassword(context, value);
                }),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {},
                      ),
                      const Text('Remember me'),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      context.push(Routes.forgotPasswordScreen);
                    },
                    child: const Text(
                      'Forget password?',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            CustomAuthButton(
              color: color,
              text: 'Login',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  print('Login button pressed');
                  goToHome!();
                }
              },
            ),
            const SizedBox(height: 16),
            NoAccountRow(
              content: 'Don\'t have an account?',
              actionText: 'Sign up',
              onPressed: () {
                goToRegister!();
              },
            ),
          ],
        ),
      ),
    );
  }
}
