import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:elevate_online_exam_app/core/constants/app_color.dart';
import 'package:elevate_online_exam_app/core/di/di.dart';
import 'package:elevate_online_exam_app/core/error_handeling/handle_error.dart';
import 'package:elevate_online_exam_app/core/functions/show_awesome_dialoge.dart';
import 'package:elevate_online_exam_app/core/functions/show_hide_loading.dart';
import 'package:elevate_online_exam_app/core/routing/routes.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/view_models/register/register_actions.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/view_models/register/register_states.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/view_models/register/register_viewmodel.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/widgets/auth/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterViewModel registerViewModel = getIt.get<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => registerViewModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Register',
              style: TextStyle(color: Colors.black, fontSize: 20)),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: BlocConsumer<RegisterViewModel, RegisterScreenState>(
              listenWhen: (previous, current) {
                if (previous is LoadingState || current is ErrorState) {
                  hideLoading(context);
                }
                return current is! InitialState;
              },
              buildWhen: (previous, current) {
                return current is InitialState ||
                    current is PasswordVisibilityState ||
                    current
                        is ValidateColorButtonState; // Add this to rebuild for button color changes
              },
              builder: (context, state) {
                if (state is InitialState ||
                    state is PasswordVisibilityState ||
                    state is ValidateColorButtonState) {
                  final isPasswordVisible = state is PasswordVisibilityState
                      ? state.isPasswordVisible
                      : registerViewModel.isPasswordVisible;
                  final isRePasswordVisible = state is PasswordVisibilityState
                      ? state.isRePasswordVisible
                      : registerViewModel.isRePasswordVisible;

                  return RegisterForm(
                    onChanged: () {
                      registerViewModel.doAction(ValidateColorButtonAction());
                    },
                    isPasswordVisible: isPasswordVisible,
                    showPassword: () =>
                        registerViewModel.doAction(ShowPasswordAction()),
                    showRePassword: () =>
                        registerViewModel.doAction(ShowRePasswordAction()),
                    isRePasswordVisible: isRePasswordVisible,
                    goToHome: () =>
                        registerViewModel.doAction(RegisterAction()),
                    usernameController: registerViewModel.userNameController,
                    firstNameController: registerViewModel.firstNameController,
                    lastNameController: registerViewModel.lastNameController,
                    emailController: registerViewModel.emailController,
                    passwordController: registerViewModel.passwordController,
                    confirmPasswordController:
                        registerViewModel.rePasswordController,
                    phoneNumberController: registerViewModel.phoneController,
                    formKey: registerViewModel.formKey,
                    onGoToRegisterPressed: () {
                      registerViewModel.doAction(GoToLoginAction());
                    },
                    color: registerViewModel.validate
                        ? AppColor.primaryColor
                        : Colors.grey,
                  );
                }
                return Container();
              },
              listener: (context, state) {
                switch (state) {
                  case LoadingState():
                    showLoading(context, 'Registering...');
                    break;
                  case ErrorState():
                    var exception = state.exception;
                    String? message = errorStateHandler(exception!);
                    showAwesomeDialog(context,
                        title: 'Error',
                        desc: message!,
                        onOk: () {},
                        dialogType: DialogType.error);
                    break;
                  case SuccessState():
                    showAwesomeDialog(context,
                        title: 'Success Register',
                        desc: 'You have been Successfully Registered',
                        onOk: () {
                      context.go(Routes.loginScreen);
                    }, dialogType: DialogType.success);
                    break;
                  case GoToLoginState():
                    context.go(Routes.loginScreen);
                    break;
                  case NavigateToHomeState():
                    context.go(Routes.homeScreen);
                    break;
                  default:
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
