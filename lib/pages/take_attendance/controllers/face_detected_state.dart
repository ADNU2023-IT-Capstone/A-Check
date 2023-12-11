import 'package:a_check/globals.dart';
import 'package:a_check/models/recognized_student.dart';
import 'package:a_check/models/school.dart';
import 'package:a_check/utils/attendance_helpers.dart';
import 'package:a_check/utils/dialogs.dart';
import 'package:a_check/widgets/correct_dialog.dart';
import 'package:flutter/material.dart';

import '../face_detected_page.dart';

class DetectedFacesState extends State<DetectedFacesPage> {
  late final Map<String, RecognizedStudent> recognizedStudents;
  late final List<Student> classStudents;

  @override
  Widget build(BuildContext context) => DetectedFacesView(this);

  @override
  void initState() {
    super.initState();

    recognizedStudents = widget.recognizedStudents;
    classStudents = widget.classStudents;
  }

  void correction(RecognizedStudent rs) async {
    final result = await showDialog(
      context: context,
      builder: (context) => CorrectDialog(
        students: classStudents,
      ),
    );

    if (result != null) {
      if (result == false) {
        setState(() {
          recognizedStudents.remove(rs.student.id);
        });
        return;
      }

      final oldStudent = rs.student;
      final Student newStudent = result;
      rs.student = newStudent;
      rs.locked = true;

      setState(() {
        recognizedStudents.remove(oldStudent.id);
        recognizedStudents[newStudent.id] = rs;
      });
    }
  }

  void finalize() async {
    final bool? result = await Dialogs.showConfirmDialog(
        context,
        const Text("Finalize attendance"),
        const Text("Recognized students will be set as present. Continue?"));

    if (result == true) {
      if (!widget.schoolClass.isScheduleToday) {
        snackbarKey.currentState!.showSnackBar(
            const SnackBar(content: Text("The class schedule isn't today!")));
        return;
      }

      snackbarKey.currentState!.showSnackBar(const SnackBar(
          content: Row(children: [
        CircularProgressIndicator(),
        SizedBox(width: 16),
        Text("Saving...")
      ])));
      AttendanceHelpers.recordAttendance(
              schoolClass: widget.schoolClass,
              classStudents: classStudents,
              recognizedStudents:
                  recognizedStudents.values.map((e) => e.student).toList())
          .whenComplete(() {
        snackbarKey.currentState!.removeCurrentSnackBar();
        snackbarKey.currentState!
            .showSnackBar(const SnackBar(content: Text("Saved to firebase!")));
      });

      snackbarKey.currentState!.showSnackBar(SnackBar(
          content: Text(
              "Took attendances of ${recognizedStudents.length} student${recognizedStudents.length > 1 ? 's' : ''}")));
      if (mounted) Navigator.pop(context);
    }
  }
}
