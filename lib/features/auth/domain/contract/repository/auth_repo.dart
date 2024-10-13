import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/request/register_request.dart';
import 'package:elevate_online_exam_app/features/auth/domain/model/app_user.dart';

abstract class AuthRepo {
  Future<Result<AppUser>> login(String email, String password);
  Future<Result<AppUser>> register(RegisterRequest registerRequest);
}
