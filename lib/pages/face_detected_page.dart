import 'dart:typed_data';

import 'package:a_check/models/student.dart';
import 'package:a_check/pages/controllers/face_detected_page.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:a_check/widgets/face_card.dart';
import 'package:flutter/material.dart';

class DetectedFacesPage extends StatefulWidget {
  const DetectedFacesPage(
      {super.key,
      required this.recognizedStudents,
      required this.recognizedFaces,
      required this.studentsList});

  final Map<Student, num> recognizedStudents;
  final Map<Student, Uint8List> recognizedFaces;
  final List<Student> studentsList;

  @override
  State<DetectedFacesPage> createState() => DetectedFacesState();
}

class DetectedFacesView
    extends WidgetView<DetectedFacesPage, DetectedFacesState> {
  const DetectedFacesView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detected Faces",
        ),
      ),
      body: GridView(
        padding: const EdgeInsets.all(16),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.74,
        ),
        children: widget.recognizedFaces.entries
            .map((e) => FaceCard(
                  student: e.key,
                  faceImageBytes: e.value,
                  confidenceValue: widget.recognizedStudents[e.key]!,
                ))
            .toList(),
      ),
    );
  }
}
