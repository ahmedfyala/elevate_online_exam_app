import 'package:json_annotation/json_annotation.dart';
part 'forgot_password_response.g.dart';
@JsonSerializable()
class ForgotPasswordResponse {
  ForgotPasswordResponse({
      this.message, 
      this.info,});

  factory  ForgotPasswordResponse.fromJson(Map<String, dynamic> json) => _$ForgotPasswordResponseFromJson(json);
  String? message;
  String? info;

  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);

}