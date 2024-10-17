import 'package:elevate_online_exam_app/features/auth/domain/model/app_user.dart';

sealed class LoginScreenState {}

class InitialState extends LoginScreenState {}

class LoadingState extends LoginScreenState {}

class ErrorState extends LoginScreenState {
  Exception? exception;
  ErrorState(this.exception);
}

class SuccessState extends LoginScreenState {
  AppUser? appUser;
  SuccessState(this.appUser);
}

class NavigateToHomeState extends LoginScreenState {}

class PasswordVisibilityState extends LoginScreenState {
  final bool isPasswordVisible;

  PasswordVisibilityState({
    required this.isPasswordVisible,
  });
}

class GoToRegisterState extends LoginScreenState {}

class ValidateColorButtonState extends LoginScreenState {}

class NavigateToFogotPasswordState extends LoginScreenState {}
