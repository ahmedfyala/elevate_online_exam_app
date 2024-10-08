import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  RegisterRequest({
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? rePassword,
    String? phone,
  }) {
    _username = username;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _password = password;
    _rePassword = rePassword;
    _phone = phone;
  }

  RegisterRequest.fromJson(dynamic json) {
    _username = json['username'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _password = json['password'];
    _rePassword = json['rePassword'];
    _phone = json['phone'];
  }
  String? _username;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _password;
  String? _rePassword;
  String? _phone;

  String? get username => _username;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get password => _password;
  String? get rePassword => _rePassword;
  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['password'] = _password;
    map['rePassword'] = _rePassword;
    map['phone'] = _phone;
    return map;
  }
}
