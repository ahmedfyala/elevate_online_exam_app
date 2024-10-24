import 'package:elevate_online_exam_app/features/auth/domain/model/app_user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({
    String? id,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? role,
    bool? isVerified,
    String? createdAt,
  }) {
    _id = id;
    _username = username;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _phone = phone;
    _role = role;
    _isVerified = isVerified;
    _createdAt = createdAt;
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  String? _id;
  String? _username;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _phone;
  String? _role;
  bool? _isVerified;
  String? _createdAt;

  String? get id => _id;
  String? get username => _username;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get phone => _phone;
  String? get role => _role;
  bool? get isVerified => _isVerified;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() => _$UserToJson(this);
  AppUser toAppUser() {
    return AppUser(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phone,
      username: username,
    );
  }
}
