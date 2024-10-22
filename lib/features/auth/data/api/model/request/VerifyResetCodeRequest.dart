import 'package:json_annotation/json_annotation.dart';
part 'VerifyResetCodeRequest.g.dart';
@JsonSerializable()
class VerifyResetCodeRequest {
  VerifyResetCodeRequest({
      this.resetCode,});

 factory VerifyResetCodeRequest.fromJson(Map<String, dynamic> json)=> _$VerifyResetCodeRequestFromJson(json);
  String? resetCode;

  Map<String, dynamic> toJson() => _$VerifyResetCodeRequestToJson(this);

}