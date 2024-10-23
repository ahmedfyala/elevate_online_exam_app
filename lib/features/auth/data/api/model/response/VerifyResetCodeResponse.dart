import 'package:json_annotation/json_annotation.dart';
part 'VerifyResetCodeResponse.g.dart';

@JsonSerializable()
class VerifyResetCodeResponse {
  VerifyResetCodeResponse({
      this.status,});

 factory VerifyResetCodeResponse.fromJson(Map<String, dynamic> json)=> _$VerifyResetCodeResponseFromJson(json);
  String? status;

  Map<String, dynamic> toJson() => _$VerifyResetCodeResponseToJson(this);

}