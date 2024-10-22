import 'package:json_annotation/json_annotation.dart';
part 'ForgotPasswordRequest.g.dart';

@JsonSerializable()
class ForgotPasswordRequest {
  ForgotPasswordRequest({
      this.email,});

 factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) => _$ForgotPasswordRequestFromJson(json);
  String? email;

  Map<String, dynamic> toJson() => _$ForgotPasswordRequestToJson(this);

}