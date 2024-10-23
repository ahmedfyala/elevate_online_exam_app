// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_selected_answers.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SelectedAnswersHiveAdapter extends TypeAdapter<SelectedAnswersHive> {
  @override
  final int typeId = 9;

  @override
  SelectedAnswersHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SelectedAnswersHive(
      questionId: fields[0] as String?,
      selectedAnswer: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SelectedAnswersHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.questionId)
      ..writeByte(1)
      ..write(obj.selectedAnswer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelectedAnswersHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
