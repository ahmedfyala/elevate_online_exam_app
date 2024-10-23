// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_answer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckAnswerRequest _$CheckAnswerRequestFromJson(Map<String, dynamic> json) =>
    CheckAnswerRequest(
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => AnswersRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      time: (json['time'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CheckAnswerRequestToJson(CheckAnswerRequest instance) =>
    <String, dynamic>{
      'answers': instance.answers,
      'time': instance.time,
    };
