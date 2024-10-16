// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exam _$ExamFromJson(Map<String, dynamic> json) => Exam(
      id: json['_id'] as String,
      title: json['title'] as String,
      duration: (json['duration'] as num).toInt(),
      subjectId: json['subject'] as String,
      numberOfQuestions: (json['numberOfQuestions'] as num).toInt(),
      active: json['active'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ExamToJson(Exam instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'duration': instance.duration,
      'subject': instance.subjectId,
      'numberOfQuestions': instance.numberOfQuestions,
      'active': instance.active,
      'createdAt': instance.createdAt.toIso8601String(),
    };
