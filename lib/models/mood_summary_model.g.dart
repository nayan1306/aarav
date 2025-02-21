// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_summary_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoodSummaryAdapter extends TypeAdapter<MoodSummary> {
  @override
  final int typeId = 0;

  @override
  MoodSummary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoodSummary(
      moodScore: fields[0] as int,
      selectedReasons: (fields[1] as List)
          .map((dynamic e) => (e as Map).cast<String, String>())
          .toList(),
      selectedFeelings: (fields[2] as List)
          .map((dynamic e) => (e as Map).cast<String, String>())
          .toList(),
      timestamp: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MoodSummary obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.moodScore)
      ..writeByte(1)
      ..write(obj.selectedReasons)
      ..writeByte(2)
      ..write(obj.selectedFeelings)
      ..writeByte(3)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoodSummaryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
