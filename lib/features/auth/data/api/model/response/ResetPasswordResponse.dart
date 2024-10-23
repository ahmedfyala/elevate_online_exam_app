import 'package:json_annotation/json_annotation.dart';
part 'ResetPasswordResponse.g.dart';
@JsonSerializable()
class ResetPasswordResponse {
  ResetPasswordResponse({
      this.message, 
      this.token,});

 factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) => _$ResetPasswordResponseFromJson(json);
  String? message;
  String? token;

  Map<String, dynamic> toJson() => _$ResetPasswordResponseToJson(this);

}