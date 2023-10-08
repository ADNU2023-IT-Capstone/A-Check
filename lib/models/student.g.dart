// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonAdapter extends TypeAdapter<Person> {
  @override
  final int typeId = 3;

  @override
  Person read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Person(
      firstName: fields[0] as String,
      middleName: fields[1] as String,
      lastName: fields[2] as String,
      email: fields[3] as String?,
      phone: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Person obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj._firstName)
      ..writeByte(1)
      ..write(obj._middleName)
      ..writeByte(2)
      ..write(obj._lastName)
      ..writeByte(3)
      ..write(obj._email)
      ..writeByte(4)
      ..write(obj._phone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StudentAdapter extends TypeAdapter<Student> {
  @override
  final int typeId = 4;

  @override
  Student read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Student(
      id: fields[5] as String,
      guardian: fields[6] as Person?,
      faceArray: (fields[7] as List?)?.cast<dynamic>(),
      firstName: fields[0] as String,
      middleName: fields[1] as String,
      lastName: fields[2] as String,
      email: fields[3] as String?,
      phone: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Student obj) {
    writer
      ..writeByte(8)
      ..writeByte(5)
      ..write(obj._id)
      ..writeByte(6)
      ..write(obj._guardian)
      ..writeByte(7)
      ..write(obj._faceArray)
      ..writeByte(0)
      ..write(obj._firstName)
      ..writeByte(1)
      ..write(obj._middleName)
      ..writeByte(2)
      ..write(obj._lastName)
      ..writeByte(3)
      ..write(obj._email)
      ..writeByte(4)
      ..write(obj._phone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
