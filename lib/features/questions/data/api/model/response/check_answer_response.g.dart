// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_answer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckAnswerResponse _$CheckAnswerResponseFromJson(Map<String, dynamic> json) =>
    CheckAnswerResponse(
      message: json['message'] as String?,
      correct: json['correct'] as num?,
      wrong: json['wrong'] as num?,
      total: json['total'] as String?,
      wrongQuestions: (json['wrongQuestions'] as List<dynamic>?)
          ?.map((e) => WrongQuestions.fromJson(e as Map<String, dynamic>))
          .toList(),
      correctQuestions: (json['correctQuestions'] as List<dynamic>?)
          ?.map((e) => CorrectQuestions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CheckAnswerResponseToJson(
        CheckAnswerResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'correct': instance.correct,
      'wrong': instance.wrong,
      'total': instance.total,
      'wrongQuestions': instance.wrongQuestions,
      'correctQuestions': instance.correctQuestions,
    };
