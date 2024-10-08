import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/model/app_user.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  String? message;
  String? token;

  AuthResponse({this.message, this.token});

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
  AppUser toAppUser() {
    return AppUser(token: token);
  }
}
