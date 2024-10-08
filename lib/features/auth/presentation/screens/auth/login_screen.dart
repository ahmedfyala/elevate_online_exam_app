import 'package:elevate_online_exam_app/core/di/di.dart';
import 'package:elevate_online_exam_app/core/error_handeling/AppExceptions.dart';
import 'package:elevate_online_exam_app/core/functions/show_hide_loading.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/view_models/login_states.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/view_models/login_viewmodel.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/widgets/auth/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  LoginViewModel loginViewModel = getIt.get<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginViewModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login',
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
            BlocConsumer<LoginViewModel, LogInScreenState>(
                listenWhen: (previous, current) {
              if (previous is LoadingState || current is ErrorState) {
                hideLoading(context);
              }
              if (current is! InitialState) {
                return true;
              } else {
                return false;
              }
            }, buildWhen: (previous, current) {
              return current is InitialState;
            }, builder: (context, state) {
              switch (state) {
                case InitialState():
                default:
                  {
                    return LoginForm(
                        emailController: loginViewModel.emailController,
                        formKey: loginViewModel.formKey,
                        passwordController: loginViewModel.passwordController,
                        login: loginViewModel.login);
                  }
              }
            }, listener: (context, state) {
              switch (state) {
                case LoadingState():
                  {
                    showLoading(context, 'Logging in...');
                    break;
                  }
                case ErrorState():
                  {
                    var exception = state.exception;
                    String? message = 'something went wrong';
                    if (exception is NoInternetException) {
                      message = 'No internet connection';
                    } else if (exception is ServerError) {
                      message = exception.message;
                    }
                    showLoading(context, message ?? '');
                    break;
                  }
                case SuccessState():
                  {
                    showLoading(context, state.appUser!.token);
                    break;
                  }
                default:
                  {}
              }
            }),
          ],
        ),
      ),
    );
  }
}
