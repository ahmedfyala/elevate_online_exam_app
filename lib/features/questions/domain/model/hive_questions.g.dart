// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_questions.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveQuestionsAdapter extends TypeAdapter<HiveQuestions> {
  @override
  final int typeId = 1;

  @override
  HiveQuestions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveQuestions(
      questionId: fields[0] as String?,
      question: fields[1] as String?,
      correct: fields[2] as String?,
      type: fields[3] as String?,
      subjectId: fields[4] as String?,
      examId: fields[5] as String?,
      duration: fields[6] as num?,
      isAnswered: fields[7] as bool?,
      selectedAnswer: fields[8] as String?,
      firstOption: fields[9] as String?,
      secondOption: fields[10] as String?,
      thirdOption: fields[11] as String?,
      fourthOption: fields[12] as String?,
      firstOptionKey: fields[13] as String?,
      secondOptionKey: fields[14] as String?,
      thirdOptionKey: fields[15] as String?,
      fourthOptionKey: fields[16] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveQuestions obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.questionId)
      ..writeByte(1)
      ..write(obj.question)
      ..writeByte(2)
      ..write(obj.correct)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.subjectId)
      ..writeByte(5)
      ..write(obj.examId)
      ..writeByte(6)
      ..write(obj.duration)
      ..writeByte(7)
      ..write(obj.isAnswered)
      ..writeByte(8)
      ..write(obj.selectedAnswer)
      ..writeByte(9)
      ..write(obj.firstOption)
      ..writeByte(10)
      ..write(obj.secondOption)
      ..writeByte(11)
      ..write(obj.thirdOption)
      ..writeByte(12)
      ..write(obj.fourthOption)
      ..writeByte(13)
      ..write(obj.firstOptionKey)
      ..writeByte(14)
      ..write(obj.secondOptionKey)
      ..writeByte(15)
      ..write(obj.thirdOptionKey)
      ..writeByte(16)
      ..write(obj.fourthOptionKey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveQuestionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
