// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_answers.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveAnswersAdapter extends TypeAdapter<HiveAnswers> {
  @override
  final int typeId = 1;

  @override
  HiveAnswers read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveAnswers(
      questionId: fields[0] as String,
      answer: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveAnswers obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.questionId)
      ..writeByte(1)
      ..write(obj.answer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveAnswersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
