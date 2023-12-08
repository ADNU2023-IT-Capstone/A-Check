import 'dart:io';

import 'package:a_check/globals.dart';
import 'package:a_check/main.dart';
import 'package:a_check/models/school.dart';
import 'package:a_check/models/school.dart';
import 'package:a_check/pages/face_detected_page.dart';
import 'package:a_check/pages/face_recognition_page.dart';
import 'package:a_check/utils/dialogs.dart';
import 'package:a_check/utils/mlservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as imglib;
import 'package:ml_algo/kd_tree.dart';
import 'package:path_provider/path_provider.dart';

class FaceRecognitionState extends State<FaceRecognitionPage> {
  final _mlService = MLService();
  List<Face> _detectedFaces = [];
  List<imglib.Image> _faceImages = [];
  List<Student> _classStudents = [], _studentsWithRegisteredFaces = [];
  KDTree? _faceDataTree;
  bool isUsingIPCamera = false;

  Future<void> processCapturedImage(InputImage inputImage) async {
    snackbarKey.currentState!.showSnackBar(const SnackBar(
        content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text("Processing image..."), CircularProgressIndicator()],
    )));

    if (!await _detectFacesFromInputImage(inputImage)) return;
    if (!await _getFaceImages(inputImage)) return;
  }

  Future<bool> _detectFacesFromInputImage(InputImage inputImage) async {
    final faces = await _mlService.getFaces(inputImage);
    if (faces.isEmpty) {
      snackbarKey.currentState!.hideCurrentSnackBar();
      snackbarKey.currentState!
          .showSnackBar(const SnackBar(content: Text("No faces detected!")));
      return false;
    }

    _detectedFaces = List.from(faces);
    return true;
  }

  Future<bool> _getFaceImages(InputImage inputImage) async {
    dynamic photo;
    if (inputImage.filePath != null && inputImage.filePath!.isNotEmpty) {
      final file = File(inputImage.filePath!);
      photo = await imglib.decodeImageFile(file.path);

      if (photo == null) return false;
    } else if (inputImage.bytes != null) {
      photo = imglib.Image.fromBytes(
          width: inputImage.metadata!.size.width.toInt(),
          height: inputImage.metadata!.size.height.toInt(),
          bytes: inputImage.bytes!.buffer);
    } else {
      return false;
    }

    if (_detectedFaces.isEmpty) {
      snackbarKey.currentState!.hideCurrentSnackBar();
      snackbarKey.currentState!
          .showSnackBar(const SnackBar(content: Text("No face images!")));
      return false;
    }

    final faceImages = await _mlService.getFaceImages(_detectedFaces, photo);
    _faceImages = List.from(faceImages);
    return true;
  }

  Future<void> _registerFace() async {
    final faceImage = _faceImages.first;
    final encodedImage = imglib.encodeJpg(faceImage);

    if (context.mounted) {
      final result = await Dialogs.showConfirmDialog(
          context, const Text("Register face"), Image.memory(encodedImage));
      if (result != null && result) {
        studentsRef
            .doc(widget.student!.id)
            .update(faceArray: await _mlService.predict(faceImage))
            .catchError((e) {
          if (context.mounted) {
            snackbarKey.currentState!.hideCurrentSnackBar();
            Navigator.pop(context, {'result': false, 'error': e});
          }
        });

        if (context.mounted) {
          snackbarKey.currentState!.hideCurrentSnackBar();
          Navigator.pop(context, true);
        }
      }
    }
  }

  Future<void> _takeAttendance() async {
    // Recognize students
    Map<Student, num> recognizedStudents = {};
    Map<Student, Uint8List> recognizedFaces = {};
    for (imglib.Image image in _faceImages) {
      List predictedArray = await _mlService.predict(image);
      final neighbor =
          _faceDataTree!.queryIterable(predictedArray.cast<num>(), 1);
      final threshold = prefs.getDouble('threshold')!;

      if (neighbor.first.distance <= threshold) {
        final student =
            _studentsWithRegisteredFaces.elementAt(neighbor.first.index);
        recognizedStudents.addAll({student: neighbor.first.distance});
        recognizedFaces.addAll({student: imglib.encodeJpg(image)});
      }
    }

    if (recognizedStudents.isEmpty) {
      snackbarKey.currentState!.hideCurrentSnackBar();
      snackbarKey.currentState!.showSnackBar(
          const SnackBar(content: Text("No recognized students!")));
      return;
    }

    // Create attendance records
    final currentDateTime = DateTime.now();
    for (Student student in _classStudents) {
      AttendanceRecord record;
      String id = attendancesRef.doc().id;
      if (recognizedStudents[student] != null) {
        record = AttendanceRecord(
            id: id,
            studentId: student.id,
            classId: widget.schoolClass!.id,
            dateTime: currentDateTime,
            status: AttendanceStatus.Present);
      } else {
        record = AttendanceRecord(
            id: id,
            studentId: student.id,
            classId: widget.schoolClass!.id,
            dateTime: currentDateTime,
            status: AttendanceStatus.Absent);
      }

      attendancesRef.doc(id).set(record);
    }

    // Display recognized students
    if (context.mounted) {
      await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DetectedFacesPage(
                recognizedStudents: recognizedStudents,
                recognizedFaces: recognizedFaces,
                studentsList: _studentsWithRegisteredFaces),
          ));
    }
  }

  void switchCamera() {
    setState(() => isUsingIPCamera = !isUsingIPCamera);
  }

  void capturePhoto(InputImage inputImage) async {
    await processCapturedImage(inputImage);

    if (widget.student != null) {
      await _registerFace();
    } else {
      await _takeAttendance();
    }
  }

  void captureScreenshot(Uint8List screenshot) async {
    snackbarKey.currentState!.showSnackBar(const SnackBar(
        content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text("Capturing screenshot..."), CircularProgressIndicator()],
    )));
    final tempDir = await getTemporaryDirectory();
    var file = await File("${tempDir.path}/screenshot.jpg").create();
    file = await file.writeAsBytes(screenshot);
    final inputImage = InputImage.fromFile(file);

    snackbarKey.currentState!.hideCurrentSnackBar();
    capturePhoto(inputImage);
  }

  Future<bool> onWillPop() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    return true;
  }

  _setupClassList() async {
    _classStudents = await widget.schoolClass!.getStudents();
    _studentsWithRegisteredFaces = [
      for (var student in _classStudents)
        if (student.faceArray.isNotEmpty) student
    ];

    List<List<num>> embeddings = [
      for (Student student in _studentsWithRegisteredFaces)
        student.faceArray.cast<num>()
    ];
    _faceDataTree = KDTree.fromIterable(embeddings);
  }

  @override
  void initState() {
    super.initState();

    if (widget.schoolClass != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _setupClassList());
    }
  }

  @override
  Widget build(BuildContext context) => FaceRecognitionView(this);
}
