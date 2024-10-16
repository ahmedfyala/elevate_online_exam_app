import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:elevate_online_exam_app/core/constants/color.dart';
import 'package:elevate_online_exam_app/core/di/di.dart';
import 'package:elevate_online_exam_app/core/error_handeling/handle_error.dart';
import 'package:elevate_online_exam_app/core/functions/show_awesome_dialoge.dart';
import 'package:elevate_online_exam_app/core/functions/show_hide_loading.dart';
import 'package:elevate_online_exam_app/core/routing/routes.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/view_models/login/login_actions.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/view_models/login/login_states.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/view_models/login/login_viewmodel.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/widgets/auth/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel loginViewModel = getIt.get<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginViewModel,
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: BlocConsumer<LoginViewModel, LoginScreenState>(
          buildWhen: (previous, current) {
            return current is InitialState ||
                current is PasswordVisibilityState ||
                current is ValidateColorButtonState;
          },
          listenWhen: (previous, current) {
            if (previous is LoadingState || current is ErrorState) {
              hideLoading(context);
            }
            return current is! InitialState;
          },
          listener: (context, state) {
            switch (state) {
              case LoadingState():
                showLoading(context, 'Logging in...');
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
                    desc: 'You have been Successfully Registered', onOk: () {
                  context.go(Routes.examQuestionsScreen);
                }, dialogType: DialogType.success);
                break;
              case NavigateToHomeState():
                context.go(Routes.examQuestionsScreen);
                break;

              default:
            }
          },
          builder: (context, state) {
            if (state is InitialState ||
                state is PasswordVisibilityState ||
                state is ValidateColorButtonState) {
              final isPasswordVisible = state is PasswordVisibilityState
                  ? state.isPasswordVisible
                  : loginViewModel.isPasswordVisible;

              if (state is LoadingState) {
                return const Center(child: CircularProgressIndicator());
              }

              return LoginForm(
                goToRegister: () =>
                    loginViewModel.doAction(NavigateToRegisterAction()),
                color: loginViewModel.validate
                    ? AppColor.primaryColor
                    : Colors.grey,
                emailController: loginViewModel.emailController,
                passwordController: loginViewModel.passwordController,
                formKey: loginViewModel.formKey,
                goToHome: () => loginViewModel.doAction(LoginAction()),
                onChanged: () {
                  loginViewModel.doAction(ValidateColorButtonAction());
                },
                isPasswordVisible: isPasswordVisible,
                showPassword: () {
                  loginViewModel.doAction(ShowPasswordAction());
                },
                goToForgetPassword: () {
                  context.go(Routes.registerScreen);
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
