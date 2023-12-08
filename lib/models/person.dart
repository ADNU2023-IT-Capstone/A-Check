import 'package:a_check/models/attendance_record.dart';
import 'package:a_check/models/school_class.dart';
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
  Student(
      {required this.id,
      required super.firstName,
      required super.middleName,
      required super.lastName,
      super.email,
      super.phoneNumber,
      List<String>? guardianIds,
      List? faceArray,
      String? photoPath}) {
    this.guardianIds = guardianIds ?? List.empty();
    this.faceArray = faceArray ?? List.empty();
    this.photoPath = photoPath ?? "";
  }

  factory Student.fromJson(Map<String, Object?> json) =>
      _$StudentFromJson(json);

  @Id()
  final String id;

  late final String photoPath;
  late final List<String> guardianIds;
  late final List faceArray;

  Map<String, Object?> toJson() => _$StudentToJson(this);

  Future<String> getPhotoUrl() async {
    if (photoPath.isEmpty) return "";

    final url = await storage.ref().child(photoPath).getDownloadURL();
    return url;
  }

  Future<Map<String, int>> getPALEValues(String classId) async {
    final attendances = (await attendancesRef.get())
        .docs
        .map((e) => e.data)
        .where(
            (element) => element.classId == classId && element.studentId == id)
        .toList();

    int present = 0, absent = 0, late = 0, excused = 0;
    for (var record in attendances) {
      switch (record.status) {
        case AttendanceStatus.Present:
          present++;
          break;
        case AttendanceStatus.Absent:
          absent++;
          break;
        case AttendanceStatus.Late:
          late++;
          break;
        case AttendanceStatus.Excused:
          excused++;
          break;
        default:
          break;
      }
    }

    return {
      'present': present,
      'absent': absent,
      'late': late,
      'excused': excused
    };
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
      String? photoPath}) {
        this.photoPath = photoPath ?? "";
      }

  factory Teacher.fromJson(Map<String, Object?> json) =>
      _$TeacherFromJson(json);

  @Id()
  final String id;

  late final String photoPath;

  Map<String, Object?> toJson() => _$TeacherToJson(this);

  Future<String> getPhotoUrl() async {
    if (photoPath.isEmpty) return "";

    final url = await storage.ref().child(photoPath).getDownloadURL();
    return url;
  }

  Future<int> get totalClasses async {
    return (await classesRef.whereTeacherId(isEqualTo: id).get()).docs.length;
  }
}

final studentsRef = StudentCollectionReference();
final guardiansRef = GuardianCollectionReference();
final teachersRef = TeacherCollectionReference();
