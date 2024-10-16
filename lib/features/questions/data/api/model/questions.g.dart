// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: json['_id'] as String,
      question: json['question'] as String,
      A1: json['A1'] as String,
      A2: json['A2'] as String,
      A3: json['A3'] as String,
      A4: json['A4'] as String?,
      correct: json['correct'] as String,
      subject: Subject.fromJson(json['subject'] as Map<String, dynamic>),
      exam: Exam.fromJson(json['exam'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      '_id': instance.id,
      'question': instance.question,
      'A1': instance.A1,
      'A2': instance.A2,
      'A3': instance.A3,
      'A4': instance.A4,
      'correct': instance.correct,
      'subject': instance.subject,
      'exam': instance.exam,
    };
