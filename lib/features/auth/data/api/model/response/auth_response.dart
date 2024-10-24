import 'package:elevate_online_exam_app/features/auth/data/api/model/response/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  AuthResponse({
    String? message,
    String? token,
    User? user,
  }) {
    _message = message;
    _token = token;
    _user = user;
  }

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
  String? _message;
  String? _token;
  User? _user;

  String? get message => _message;
  String? get token => _token;
  User? get user => _user;

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
