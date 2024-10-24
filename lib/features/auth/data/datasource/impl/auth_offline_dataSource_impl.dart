import 'dart:convert';

import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/auth/data/datasource/contracts/auth_datasource.dart';
import 'package:elevate_online_exam_app/features/auth/domain/model/app_user.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/shared_prefrense/token_storage.dart';

@Injectable(as: AuthOfflineDataSource)
class AuthOfflineDataSourceImpl implements AuthOfflineDataSource {
  MyServices myServices;
  AuthOfflineDataSourceImpl(this.myServices);
  @override
  Future<Result<void>> deleteUser() {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<AppUser?> getUser() async {
    try {
      var sharedPreferences = await myServices.getSharedPreferences();
      var user = sharedPreferences.getString('user');
      if (user == null) {
        return null;
      }
      var userJson = jsonDecode(user);
      return AppUser.fromJson(userJson); // Convert from JSON
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> saveUser(AppUser appUser) async {
    var user = jsonEncode(appUser.toJson()); // Convert to JSON
    try {
      var sharedPreferences = await myServices.getSharedPreferences();
      await sharedPreferences.setString('user', user);
    } catch (e) {
      throw Exception(e);
    }
  }
}
