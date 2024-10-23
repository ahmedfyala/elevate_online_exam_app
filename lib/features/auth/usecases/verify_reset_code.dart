import 'package:elevate_online_exam_app/features/auth/data/api/model/response/VerifyResetCodeResponse.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/response/forgot_password_response.dart';
import 'package:injectable/injectable.dart';
import '../../../core/error_handeling/Result.dart';
import '../data/api/model/request/ForgotPasswordRequest.dart';
import '../data/api/model/request/VerifyResetCodeRequest.dart';
import '../domain/contract/repository/auth_repo.dart';
import '../domain/model/app_user.dart';

@injectable
class VerifyResetCodeUseCase {
  final AuthRepo _authRepository;

  VerifyResetCodeUseCase(this._authRepository);


  Future<Result<VerifyResetCodeResponse>> invoke(VerifyResetCodeRequest verifyResetCodeRequest) {
    return _authRepository.verifyResetCode( verifyResetCodeRequest);
  }
}