import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/auth/domain/contract/repository/auth_repo.dart';
import 'package:elevate_online_exam_app/features/auth/domain/model/app_user.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  final AuthRepo _authRepository;

  LoginUseCase(this._authRepository);

  Future<Result<AppUser>> invoke(String email, String password) {
    return _authRepository.login(email, password);
  }
}
