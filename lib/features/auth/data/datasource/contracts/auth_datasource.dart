import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/auth/domain/model/app_user.dart';

abstract class AuthOnlineDataSource {
  Future<Result<AppUser>> login(String email, String password);
  Future<Result<AppUser>> register(
      String userName,
      String firstName,
      String lastName,
      String email,
      String password,
      String rePassword,
      String phone);
}

abstract class AuthOfflineDataSource {
  Future<Result<AppUser>> login(String email, String password);
}
