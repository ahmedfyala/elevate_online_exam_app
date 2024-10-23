import 'package:elevate_online_exam_app/features/auth/data/api/model/request/ResetPasswordRequest.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/response/forgot_password_response.dart';
import 'package:injectable/injectable.dart';
import '../../../core/error_handeling/Result.dart';
import '../data/api/model/request/ForgotPasswordRequest.dart';
import '../data/api/model/response/ResetPasswordResponse.dart';
import '../domain/contract/repository/auth_repo.dart';
import '../domain/model/app_user.dart';

@injectable
class ResetPasswordUseCase {
  final AuthRepo _authRepository;

  ResetPasswordUseCase(this._authRepository);


  Future<Result<ResetPasswordResponse>> invoke(ResetPasswordRequest resetPasswordRequest) {
    return _authRepository.resetPassword( resetPasswordRequest);
  }
}