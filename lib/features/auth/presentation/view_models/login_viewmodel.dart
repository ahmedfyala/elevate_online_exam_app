import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/auth/domain/model/app_user.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/view_models/login_states.dart';
import 'package:elevate_online_exam_app/features/auth/usecases/login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'login_actions.dart';

@injectable
class LoginViewModel extends Cubit<LogInScreenState> {
  LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase) : super(const InitialState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  void doAction(AuthActions action) {
    if (action is LoginAction) {
      _login();
    }
  }

  void _login() async {
    emit(const LoadingState());
    if (formKey.currentState!.validate()) {
      var result = await _loginUseCase.invoke(
          emailController.text, passwordController.text);
      switch (result) {
        case Success<AppUser>():
          emit(SuccessState(result.data));
          break;
        case Fail<AppUser>():
          emit(ErrorState(result.exception));
          break;
        case Loading<AppUser>():
          emit(const LoadingState());
          break;
      }
    }
  }
}
