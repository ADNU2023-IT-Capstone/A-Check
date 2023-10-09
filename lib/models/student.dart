import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'student.g.dart';

@HiveType(typeId: 3)
class Person {
  @HiveField(0)
  String firstName;

  @HiveField(1)
  String middleName;

  @HiveField(2)
  String lastName;

  @HiveField(3)
  String? email;

  @HiveField(4)
  String? phone;

  Person(
      {required this.firstName,
      required this.middleName,
      required this.lastName,
      this.email,
      this.phone});

  @override
  String toString() {
    if (middleName.isEmpty) return "$firstName $lastName";

    return "$firstName ${middleName[0]}. $lastName";
  }
}

@HiveType(typeId: 4)
class Student extends Person with HiveObjectMixin {
  @HiveField(5)
  String id;

  @HiveField(6)
  Person? guardian;

  @HiveField(7)
  List? faceArray;

  Student(
      {required this.id,
      required firstName,
      required middleName,
      required lastName,
      email,
      phone,
      this.guardian,
      this.faceArray})
      : super(
            firstName: firstName,
            middleName: middleName,
            lastName: lastName,
            email: email,
            phone: phone);

  @override
  String get key => id;

  bool hasRegisteredFace() {
    if (faceArray != null && faceArray!.isNotEmpty) {
      return true;
    }

    return false;
  }
}

class StudentValueNotifier extends ValueNotifier<Student> {
  StudentValueNotifier(Student person) : super(person);
}