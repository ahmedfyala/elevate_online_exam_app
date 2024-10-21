import 'package:json_annotation/json_annotation.dart';

part 'subject.g.dart';

@JsonSerializable()
class Subject {
  Subject({
    String? id,
    String? name,
    String? icon,
    String? createdAt,
  }) {
    _id = id;
    _name = name;
    _icon = icon;
    _createdAt = createdAt;
  }

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  String? _id;
  String? _name;
  String? _icon;
  String? _createdAt;

  String? get id => _id;
  String? get name => _name;
  String? get icon => _icon;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}
