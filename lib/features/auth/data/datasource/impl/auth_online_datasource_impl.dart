import 'dart:async';

import 'package:elevate_online_exam_app/core/api_executer/api_extensions.dart';
import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/request/register_request.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/retrofit_client.dart';
import 'package:elevate_online_exam_app/features/auth/data/datasource/contracts/auth_datasource.dart';
import 'package:elevate_online_exam_app/features/auth/domain/model/app_user.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDatasourceImpl extends AuthOnlineDataSource {
  RetrofitClient retrofitClient;
  AuthOnlineDatasourceImpl(this.retrofitClient);
  @override
  Future<Result<AppUser>> login(String email, String password) async {
    return executeApi<AppUser>(
      () async {
        var result = await retrofitClient.login({
          "email": email,
          "password": password,
        });

        var appUser = result.user!.toAppUser();
        appUser.token = result.token;
        return Success(data: appUser);
      },
    );
  }

  @override
  Future<Result<AppUser>> register(RegisterRequest registerRequest) async {
    return executeApi<AppUser>(
      () async {
        var result = await retrofitClient.register(registerRequest);
        var appUser = result.user!.toAppUser();
        appUser.token = result.token;
        return Success(data: appUser);
      },
    );
  }
}
