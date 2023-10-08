import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'student.g.dart';

@HiveType(typeId: 3)
class Person {
  @HiveField(0)
  late String _firstName;

  @HiveField(1)
  late String _middleName;

  @HiveField(2)
  late String _lastName;

  @HiveField(3)
  String? _email;

  @HiveField(4)
  String? _phone;

  Person(
      {required firstName,
      required middleName,
      required lastName,
      email,
      phone}) {
    _firstName = firstName;
    _middleName = middleName;
    _lastName = lastName;
    _email = email;
    _phone = phone;
  }

  String get firstName => _firstName;
  String get middleName => _middleName;
  String get lastName => _lastName;
  String? get email => _email;
  String? get phone => _phone;

  set value(Person newPerson) {
    _firstName = newPerson._firstName;
    _middleName = newPerson._middleName;
    _lastName = newPerson._lastName;
    _email = newPerson._email;
    _phone = newPerson._phone;
  }

  set firstName(String firstName) {
    _firstName = firstName;
  }

  set middleName(String middleName) {
    _middleName = middleName;
  }

  set lastName(String lastName) {
    _lastName = lastName;
  }

  set email(String? email) {
    _email = email;
  }

  set phone(String? phone) {
    _phone = phone;
  }

  @override
  String toString() {
    if (_middleName.isEmpty) return "$_firstName $_lastName";

    return "$_firstName ${_middleName[0]}. $_lastName";
  }
}

@HiveType(typeId: 4)
class Student extends Person with HiveObjectMixin {
  @HiveField(5)
  late String _id;

  @HiveField(6)
  Person? _guardian;

  @HiveField(7)
  List? _faceArray;

  Student(
      {required id,
      required firstName,
      required middleName,
      required lastName,
      email,
      phone,
      guardian,
      faceArray})
      : super(
            firstName: firstName,
            middleName: middleName,
            lastName: lastName,
            email: email,
            phone: phone) {
    _id = id;
    _guardian = guardian;
    _faceArray = faceArray;
  }

  @override
  String get key => _id;
  String get id => _id;
  Person? get guardian => _guardian;
  List? get faceArray => _faceArray;

  set guardian(Person? guardian) {
    _guardian = guardian;
  }

  set faceArray(List? faceArray) {
    _faceArray = faceArray;
  }

  bool hasRegisteredFace() {
    if (_faceArray != null && _faceArray!.isNotEmpty) {
      return true;
    }

    return false;
  }
}

class StudentValueNotifier extends ValueNotifier<Student> {
  StudentValueNotifier(Student person) : super(person);
}