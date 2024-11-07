import 'package:json_annotation/json_annotation.dart';

part 'subject.g.dart';

@JsonSerializable()
class Subject {
  Subject({this.id, this.name, this.icon, this.createdAt});
  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
  @JsonKey(name: '_id') // Explicitly define JSON key
  final String? id;

  @JsonKey(name: 'name') // Explicitly define JSON key
  final String? name;
  @JsonKey(name: 'icon') // Explicitly define JSON key
  final String? icon;

  @JsonKey(name: 'createdAt') // Explicitly define JSON key
  final String? createdAt;

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}
