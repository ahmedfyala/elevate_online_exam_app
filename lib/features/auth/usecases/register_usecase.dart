import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/request/register_request.dart';
import 'package:elevate_online_exam_app/features/auth/domain/contract/repository/auth_repo.dart';
import 'package:elevate_online_exam_app/features/auth/domain/model/app_user.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  final AuthRepo _authRepository;

  RegisterUseCase(this._authRepository);

  Future<Result<AppUser>> invoke(RegisterRequest registerRequest) {
    return _authRepository.register(
      registerRequest,
    );
  }
}
