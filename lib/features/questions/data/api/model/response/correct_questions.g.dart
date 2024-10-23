// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'correct_questions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CorrectQuestions _$CorrectQuestionsFromJson(Map<String, dynamic> json) =>
    CorrectQuestions(
      qid: json['qid'] as String?,
      question: json['question'] as String?,
      correctAnswer: json['correctAnswer'] as String?,
      answers: json['answers'],
    );

Map<String, dynamic> _$CorrectQuestionsToJson(CorrectQuestions instance) =>
    <String, dynamic>{
      'qid': instance.qid,
      'question': instance.question,
      'correctAnswer': instance.correctAnswer,
      'answers': instance.answers,
    };
