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
}

@HiveType(typeId: 4)
class Student extends Person with HiveObjectMixin {
  @HiveField(5)
  String id;

  @HiveField(6)
  List<Person>? guardians;

  @HiveField(7)
  List? faceArray;

  Student(
      {required firstName,
      required middleName,
      required lastName,
      required this.id,
      email,
      phone,
      this.guardians,
      this.faceArray})
      : super(
            firstName: firstName,
            middleName: middleName,
            lastName: lastName,
            email: email,
            phone: phone);

  @override
  String toString() {
    return "$firstName ${middleName[0]}. $lastName";
  }

  bool hasRegisteredFace() {
    if (faceArray != null && faceArray!.isNotEmpty) {
      return true;
    }

    return false;
  }
}
