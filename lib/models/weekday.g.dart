// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekday.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeekDayAdapter extends TypeAdapter<WeekDay> {
  @override
  final int typeId = 3;

  @override
  WeekDay read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeekDay(
      fields[2] as String,
      fields[3] as int,
    )
      ..isSelected = fields[0] as bool
      ..occurrence = fields[1] as TimeOfDay;
  }

  @override
  void write(BinaryWriter writer, WeekDay obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.isSelected)
      ..writeByte(1)
      ..write(obj.occurrence)
      ..writeByte(2)
      ..write(obj.dayName)
      ..writeByte(3)
      ..write(obj.dayOfWeek);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeekDayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
