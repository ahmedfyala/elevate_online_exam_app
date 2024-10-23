import 'package:elevate_online_exam_app/features/auth/data/api/model/response/forgot_password_response.dart';
import 'package:injectable/injectable.dart';
import '../../../core/error_handeling/Result.dart';
import '../data/api/model/request/ForgotPasswordRequest.dart';
import '../domain/contract/repository/auth_repo.dart';
import '../domain/model/app_user.dart';

@injectable
class ForgetPasswordUseCase {
  final AuthRepo _authRepository;

  ForgetPasswordUseCase(this._authRepository);


  Future<Result<ForgotPasswordResponse>> invoke(ForgotPasswordRequest forgotPasswordRequest) {
    return _authRepository.forgetPassword( forgotPasswordRequest);
  }
}