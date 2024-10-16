import 'package:json_annotation/json_annotation.dart';

part 'subject.g.dart';

@JsonSerializable()
class Subject {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String icon;
  final DateTime createdAt;

  Subject({
    required this.id,
    required this.name,
    required this.icon,
    required this.createdAt,
  });

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}
