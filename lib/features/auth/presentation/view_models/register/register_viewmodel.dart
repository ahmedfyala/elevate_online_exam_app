import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/request/register_request.dart';
import 'package:elevate_online_exam_app/features/auth/domain/model/app_user.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/view_models/register/register_actions.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/view_models/register/register_states.dart';
import 'package:elevate_online_exam_app/features/auth/usecases/register_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterScreenState> {
  final RegisterUseCase _registerUseCase;
  RegisterViewModel(this._registerUseCase) : super(InitialState());
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;
  bool isRePasswordVisible = true;
  bool validate = false;
  void doAction(RegisterScreenActions action) {
    switch (action) {
      case RegisterAction():
        _register();
        break;
      case GoToLoginAction():
        _goToLogin();
        break;
      case ShowPasswordAction():
        _showPassword();
      case ShowRePasswordAction():
        _showRePassword();
      case NavigateToHomeAction():
        _navigateToHome();
      case ValidateColorButtonAction():
        _validateColorButton();
    }
  }

  void _register() async {
    if (formKey.currentState!.validate()) {
      emit(LoadingState());
      try {
        var registerRequest = RegisterRequest(
          username: userNameController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          password: passwordController.text,
          rePassword: rePasswordController.text,
          phone: phoneController.text,
        );
        var result = await _registerUseCase.invoke(
          registerRequest,
        );
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

  void _goToLogin() {
    emit(GoToLoginState());
  }

  void _showPassword() {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordVisibilityState(
      isPasswordVisible: isPasswordVisible,
      isRePasswordVisible: isRePasswordVisible,
    )); // Add this to trigger UI update
  }

  void _showRePassword() {
    isRePasswordVisible = !isRePasswordVisible;
    emit(PasswordVisibilityState(
      isPasswordVisible: isPasswordVisible,
      isRePasswordVisible: isRePasswordVisible,
    ));
  }

  void _navigateToHome() {
    emit(NavigateToHomeState());
  }

  _validateColorButton() {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        rePasswordController.text.isEmpty ||
        phoneController.text.isEmpty) {
      validate = false;
    } else if (!formKey.currentState!.validate()) {
      validate = false;
    } else {
      validate = true;
    }
    emit(ValidateColorButtonState());
  }
}
