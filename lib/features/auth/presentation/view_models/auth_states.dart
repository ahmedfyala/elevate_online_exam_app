import 'package:elevate_online_exam_app/features/auth/domain/model/app_user.dart';

sealed class AuthState {
  const AuthState();
}

class InitialState extends AuthState {
  const InitialState();
}

class LoadingState extends AuthState {
  const LoadingState();
}

class ErrorState extends AuthState {
  Exception? exception;
  ErrorState(this.exception);
}

class SuccessState extends AuthState {
  AppUser? appUser;
  SuccessState(this.appUser);
}
