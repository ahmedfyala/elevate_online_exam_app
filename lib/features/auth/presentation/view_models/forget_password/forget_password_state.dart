sealed class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}
class ForgotPasswordSuccess extends ForgotPasswordState {}
class ForgotPasswordFailure extends ForgotPasswordState {
  Exception? exception;
  ForgotPasswordFailure(this.exception);
}

class OTPSentLoading extends ForgotPasswordState {}
class OTPSentSuccess extends ForgotPasswordState {}
class OTPSentFailure extends ForgotPasswordState {
  Exception? exception;
  OTPSentFailure(this.exception);
}


class ResetPasswordLoading extends ForgotPasswordState {}
class ResetPasswordFailure extends ForgotPasswordState {
  Exception? exception;
  ResetPasswordFailure(this.exception);
}
class ResetPasswordSuccess extends ForgotPasswordState {}
