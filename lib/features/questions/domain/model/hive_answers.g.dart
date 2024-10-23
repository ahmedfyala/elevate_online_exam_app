// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_answers.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResultsHiveAdapter extends TypeAdapter<ResultsHive> {
  @override
  final int typeId = 5;

  @override
  ResultsHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResultsHive(
      correct: fields[0] as num?,
      wrong: fields[1] as num?,
      total: fields[2] as String?,
      subjectId: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ResultsHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.correct)
      ..writeByte(1)
      ..write(obj.wrong)
      ..writeByte(2)
      ..write(obj.total)
      ..writeByte(3)
      ..write(obj.subjectId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultsHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
