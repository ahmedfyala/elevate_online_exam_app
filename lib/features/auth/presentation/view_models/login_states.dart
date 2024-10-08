import 'package:elevate_online_exam_app/features/auth/domain/model/app_user.dart';

sealed class LogInScreenState {
  const LogInScreenState();
}

class InitialState extends LogInScreenState {
  const InitialState();
}

class LoadingState extends LogInScreenState {
  const LoadingState();
}

class ErrorState extends LogInScreenState {
  Exception? exception;
  ErrorState(this.exception);
}

class SuccessState extends LogInScreenState {
  AppUser? appUser;
  SuccessState(this.appUser);
}
