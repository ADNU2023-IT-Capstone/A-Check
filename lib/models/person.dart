import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

const firestoreSerializable = JsonSerializable(
    converters: firestoreJsonConverters,
    explicitToJson: true,
    createFieldMap: true,
    createPerFieldToJson: true);

@JsonSerializable()
class Person {
  Person({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    this.email,
    this.phoneNumber,
  });

  final String firstName, middleName, lastName;
  final String? email, phoneNumber;

  String get fullName => "$firstName ${middleName[0]}. $lastName";
}

@Collection<Student>('students')
@firestoreSerializable
class Student extends Person {
  Student({
    required this.id,
    required super.firstName,
    required super.middleName,
    required super.lastName,
    super.email,
    super.phoneNumber,
    List<String>? guardianIds,
    List? faceArray,
  }) {
    this.guardianIds = guardianIds ?? List.empty();
    this.faceArray = faceArray ?? List.empty();
  }

  factory Student.fromJson(Map<String, Object?> json) =>
      _$StudentFromJson(json);

  @Id()
  final String id;

  late final List<String> guardianIds;
  late final List faceArray;

  Map<String, Object?> toJson() => _$StudentToJson(this);

  Map<String, int> getPALEValues(String classKey) {
    return {'present': 0, 'absent': 0, 'late': 0, 'excused': 0};
    // TODO: fetch PALE values from firebase
    // final attendances = HiveBoxes.attendancesBox()
    //     .values
    //     .cast<AttendanceRecord>()
    //     .where((element) =>
    //         element.classKey == classKey && element.studentId == id);

    // int present = 0, absent = 0, late = 0, excused = 0;
    // for (AttendanceRecord record in attendances) {
    //   switch (record.status) {
    //     case AttendanceStatus.present:
    //       present++;
    //       break;
    //     case AttendanceStatus.absent:
    //       absent++;
    //       break;
    //     case AttendanceStatus.late:
    //       late++;
    //       break;
    //     case AttendanceStatus.excused:
    //       excused++;
    //       break;
    //     default:
    //       break;
    //   }
    // }

    // return {
    //   'present': present,
    //   'absent': absent,
    //   'late': late,
    //   'excused': excused
    // };
  }

  // TODO: register face for firebase
  Future<void> registerFace(List faceArray, dynamic facePhotoBytes) {
    this.faceArray = faceArray;
    // this.facePhotoBytes = facePhotoBytes;
    return Future.delayed(Duration.zero);
  }
}

@Collection<Guardian>('guardians')
@firestoreSerializable
class Guardian extends Person {
  Guardian({
    required this.id,
    required super.firstName,
    required super.middleName,
    required super.lastName,
    super.email,
    super.phoneNumber,
  });

  factory Guardian.fromJson(Map<String, Object?> json) =>
      _$GuardianFromJson(json);

  @Id()
  final String id;

  Map<String, Object?> toJson() => _$GuardianToJson(this);
}

@Collection<Teacher>('teachers')
@firestoreSerializable
class Teacher extends Person {
  Teacher(
      {required this.id,
      required super.firstName,
      required super.middleName,
      required super.lastName,
      super.email,
      super.phoneNumber,
      List<String>? classIds}) {
    this.classIds = classIds ?? List.empty();
  }

  factory Teacher.fromJson(Map<String, Object?> json) =>
      _$TeacherFromJson(json);

  @Id()
  final String id;

  late final List<String>? classIds;

  Map<String, Object?> toJson() => _$TeacherToJson(this);
}

final studentsRef = StudentCollectionReference();
final guardiansRef = GuardianCollectionReference();
final teachersRef = TeacherCollectionReference();
