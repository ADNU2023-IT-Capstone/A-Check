// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClassAdapter extends TypeAdapter<Class> {
  @override
  final int typeId = 0;

  @override
  Class read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Class(
      code: fields[0] as String,
      name: fields[1] as String,
      section: fields[2] as String,
      schedule: (fields[3] as List).cast<ClassSchedule>(),
      studentIds: (fields[4] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Class obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.section)
      ..writeByte(3)
      ..write(obj.schedule)
      ..writeByte(4)
      ..write(obj.studentIds.toList());
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ClassScheduleAdapter extends TypeAdapter<ClassSchedule> {
  @override
  final int typeId = 2;

  @override
  ClassSchedule read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ClassSchedule(
      day: fields[1] as DaysOfTheWeek,
      startTimeHour: fields[2] as int,
      startTimeMinute: fields[3] as int,
      endTimeHour: fields[4] as int,
      endTimeMinute: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ClassSchedule obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.day)
      ..writeByte(2)
      ..write(obj.startTimeHour)
      ..writeByte(3)
      ..write(obj.startTimeMinute)
      ..writeByte(4)
      ..write(obj.endTimeHour)
      ..writeByte(5)
      ..write(obj.endTimeMinute);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClassScheduleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DaysOfTheWeekAdapter extends TypeAdapter<DaysOfTheWeek> {
  @override
  final int typeId = 1;

  @override
  DaysOfTheWeek read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DaysOfTheWeek.monday;
      case 1:
        return DaysOfTheWeek.tuesday;
      case 2:
        return DaysOfTheWeek.wednesday;
      case 3:
        return DaysOfTheWeek.thursday;
      case 4:
        return DaysOfTheWeek.friday;
      case 5:
        return DaysOfTheWeek.saturday;
      case 6:
        return DaysOfTheWeek.sunday;
      default:
        return DaysOfTheWeek.monday;
    }
  }

  @override
  void write(BinaryWriter writer, DaysOfTheWeek obj) {
    switch (obj) {
      case DaysOfTheWeek.monday:
        writer.writeByte(0);
        break;
      case DaysOfTheWeek.tuesday:
        writer.writeByte(1);
        break;
      case DaysOfTheWeek.wednesday:
        writer.writeByte(2);
        break;
      case DaysOfTheWeek.thursday:
        writer.writeByte(3);
        break;
      case DaysOfTheWeek.friday:
        writer.writeByte(4);
        break;
      case DaysOfTheWeek.saturday:
        writer.writeByte(5);
        break;
      case DaysOfTheWeek.sunday:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DaysOfTheWeekAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
