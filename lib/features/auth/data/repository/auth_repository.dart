import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/request/register_request.dart';
import 'package:elevate_online_exam_app/features/auth/data/datasource/contracts/auth_datasource.dart';
import 'package:elevate_online_exam_app/features/auth/domain/contract/repository/auth_repo.dart';
import 'package:elevate_online_exam_app/features/auth/domain/model/app_user.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepositoryImpl implements AuthRepo {
  AuthOfflineDataSource authOfflineDataSource;
  AuthOnlineDataSource authOnlineDataSource;

  AuthRepositoryImpl(this.authOfflineDataSource, this.authOnlineDataSource);
  @override
  Future<Result<AppUser>> login(String email, String password) async {
    var result = await authOnlineDataSource.login(
      email,
      password,
    );
    if (result is Success<AppUser>) {
      await authOfflineDataSource.saveUser(result.data!);
    }
    return result;
  }

  @override
  Future<Result<AppUser>> register(RegisterRequest registerRequest) async {
    var result = await authOnlineDataSource.register(registerRequest);
    if (result is Success<AppUser>) {
      await authOfflineDataSource.saveUser(result.data!);
    }
    return result;
  }
}
