import 'package:elevate_online_exam_app/core/di/di.dart';
import 'package:elevate_online_exam_app/core/error_handeling/handle_error.dart';
import 'package:elevate_online_exam_app/core/functions/show_hide_loading.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/view_models/auth_actions.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/view_models/auth_states.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/view_models/login_viewmodel.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/widgets/auth/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginViewModel loginViewModel = getIt.get<LoginViewModel>();

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
            BlocConsumer<LoginViewModel, AuthState>(
              listenWhen: (previous, current) {
                // Hide loading for transitions
                if (previous is LoadingState || current is ErrorState) {
                  hideLoading(context);
                }
                return current is! InitialState;
              },
              buildWhen: (previous, current) {
                return current is InitialState;
              },
              builder: (context, state) {
                if (state is InitialState) {
                  return LoginForm(
                    emailController: loginViewModel.emailController,
                    formKey: loginViewModel.formKey,
                    passwordController: loginViewModel.passwordController,
                    login: () => loginViewModel.doAction(
                        LoginAction()), // Pass an instance of LoginAction
                  );
                }
                return Container(); // Return an empty container for non-initial states
              },
              listener: (context, state) {
                if (state is LoadingState) {
                  showLoading(context, 'Logging in...');
                } else if (state is ErrorState) {
                  var exception = state.exception;
                  String? message = errorStateHandler(exception!);
                  showLoading(context, message ?? '');
                } else if (state is SuccessState) {
                  showLoading(context, state.appUser!.token);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
