import 'package:a_check/models/recognized_student.dart';
import 'package:a_check/models/school.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:a_check/widgets/face_card.dart';
import 'package:flutter/material.dart';

import 'controllers/face_detected_state.dart';

class DetectedFacesPage extends StatefulWidget {
  const DetectedFacesPage(
      {super.key,
      required this.recognizedStudents,
      required this.classStudents,
      required this.schoolClass});

  final SchoolClass schoolClass;
  final Map<String, RecognizedStudent> recognizedStudents;
  final List<Student> classStudents;

  @override
  State<DetectedFacesPage> createState() => DetectedFacesState();
}

class DetectedFacesView
    extends WidgetView<DetectedFacesPage, DetectedFacesState> {
  const DetectedFacesView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      actions: [IconButton(icon: const Icon(Icons.save), tooltip: "Confirm detected students", onPressed: state.finalize,)],
      title: const Text(
        "Detected Faces",
      ),
    );
  }

  // FloatingActionButton buildFab() {
  //   return FloatingActionButton.extended(
  //     onPressed: state.finalize,
  //     elevation: 0.5,
  //     backgroundColor:  Colors.green,
  //     foregroundColor: Colors.white,
  //     label: const Text("Next"),
  //     icon: const Icon(Icons.arrow_forward_ios),
  //   );
  // }

  GridView buildBody() {
    return GridView.count(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const ClampingScrollPhysics(),
      crossAxisCount: 3,
      crossAxisSpacing: 2,
      mainAxisSpacing: 8,
      childAspectRatio: 1,
      semanticChildCount: state.recognizedStudents.length,
      children: state.recognizedStudents.entries
          .map((e) => FaceCard(
                student: e.value.student,
                faceImageBytes: e.value.jpegBytes,
                distance: e.value.distance,
                onTap: () => state.correction(e.value),
              ))
          .toList(),
    );
  }
}
