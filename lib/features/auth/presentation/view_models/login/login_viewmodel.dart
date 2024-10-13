import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/auth/domain/model/app_user.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/view_models/login/login_actions.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/view_models/login/login_states.dart';
import 'package:elevate_online_exam_app/features/auth/usecases/login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginScreenState> {
  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase) : super(InitialState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;

  bool validate = false;
  void doAction(LoginScreenActions action) {
    switch (action) {
      case LoginAction():
        _login();
        break;
      case NavigateToRegisterAction():
        _goToRegister();
        break;
      case NavigateToHomeAction():
        _navigateToHome();
        break;
      case ValidateColorButtonAction():
        _validateColorButton();
        break;
      case ShowPasswordAction():
        _showPassword();
        break;
    }
  }

  void _login() async {
    if (formKey.currentState!.validate()) {
      emit(LoadingState());

      try {
        var result = await _loginUseCase.invoke(
            emailController.text, passwordController.text);
        print(result);

        if (result is Success<AppUser>) {
          emit(SuccessState(result.data));
        } else if (result is Fail<AppUser>) {
          emit(ErrorState(result.exception));
        } else {
          emit(LoadingState());
        }
      } catch (e) {
        emit(ErrorState(e as Exception?));
      }
    }
  }

  void _navigateToHome() {
    emit(NavigateToHomeState());
  }

  _validateColorButton() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      validate = false;
    } else if (!formKey.currentState!.validate()) {
      validate = false;
    } else {
      validate = true;
    }
    emit(ValidateColorButtonState());
  }

  void _showPassword() {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordVisibilityState(
      isPasswordVisible: isPasswordVisible,
    ));
  }

  void _goToRegister() {
    emit(goToRegisterState());
  }
}
