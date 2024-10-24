// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wrong_questions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WrongQuestions _$WrongQuestionsFromJson(Map<String, dynamic> json) =>
    WrongQuestions(
      qid: json['qid'] as String?,
      question: json['question'] as String?,
      inCorrectAnswer: json['inCorrectAnswer'] as String?,
      correctAnswer: json['correctAnswer'] as String?,
      answers: json['answers'],
    );

Map<String, dynamic> _$WrongQuestionsToJson(WrongQuestions instance) =>
    <String, dynamic>{
      'qid': instance.qid,
      'question': instance.question,
      'inCorrectAnswer': instance.inCorrectAnswer,
      'correctAnswer': instance.correctAnswer,
      'answers': instance.answers,
    };
