import 'package:elevate_online_exam_app/core/helpers/validations.dart';
import 'package:elevate_online_exam_app/core/widgets/custom_auth_button.dart';
import 'package:elevate_online_exam_app/core/widgets/custom_text_form_feild.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/widgets/auth/no_account_row.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({
    super.key,
    required this.usernameController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneNumberController,
    required this.formKey,
    required this.onGoToRegisterPressed,
    this.isPasswordVisible,
    this.showPassword,
    this.showRePassword,
    this.isRePasswordVisible,
    required this.goToHome,
    required this.color,
    required this.onChanged,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneNumberController;
  final void Function() onGoToRegisterPressed;
  final bool? isPasswordVisible;
  final void Function()? showPassword;
  final void Function()? showRePassword;
  final bool? isRePasswordVisible;
  final void Function()? goToHome;
  final Color color;
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        onChanged: onChanged,
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
                isPasswordVisible:
                    isPasswordVisible!, // Correct visibility state
                showPassword: showPassword, // Toggle function
                validator: (value) {
                  return Validations.validatePassword(context, value);
                },
              ),
              const SizedBox(height: 24),
              CustomTextFormField(
                labelText: 'Confirm password',
                hintText: 'Confirm password',
                controller: confirmPasswordController,
                isPasswordVisible:
                    isRePasswordVisible!, // Correct visibility state
                showPassword: showRePassword, // Toggle function
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  return Validations.validateConfirmPassword(
                    context,
                    passwordController.text,
                    value,
                  );
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
                color: color,
                text: 'Signup',
                onPressed: () {
                  print('Signup button pressed');
                  goToHome!();
                },
              ),
              const SizedBox(height: 16),
              NoAccountRow(
                  content: 'Already have an account',
                  actionText: 'Login',
                  onPressed: onGoToRegisterPressed)
            ],
          ),
        ),
      ),
    );
  }
}
