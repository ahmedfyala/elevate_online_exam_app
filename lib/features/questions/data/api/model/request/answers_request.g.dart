// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answers_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswersRequest _$AnswersRequestFromJson(Map<String, dynamic> json) =>
    AnswersRequest(
      questionId: json['questionId'] as String?,
      correct: json['correct'] as String?,
    );

Map<String, dynamic> _$AnswersRequestToJson(AnswersRequest instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'correct': instance.correct,
    };
