import 'dart:io';

import 'package:a_check/globals.dart';
import 'package:a_check/main.dart';
import 'package:a_check/models/attendance_record.dart';
import 'package:a_check/models/student.dart';
import 'package:a_check/pages/face_recognition_page.dart';
import 'package:a_check/utils/dialogs.dart';
import 'package:a_check/utils/localdb.dart';
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

  void processScreenshot(Uint8List screenshot) async {
    snackbarKey.currentState!.showSnackBar(const SnackBar(
        content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text("Capturing screenshot..."), CircularProgressIndicator()],
    )));
    final tempDir = await getTemporaryDirectory();
    final file = await File("${tempDir.path}/screenshot.jpg").create();
    await file.writeAsBytes(screenshot);
    final inputImage = InputImage.fromFile(file);

    snackbarKey.currentState!.hideCurrentSnackBar();
    processCapturedImage(inputImage);
  }

  processCapturedImage(InputImage inputImage) async {
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
      photo = File(inputImage.filePath!);
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

  _registerFace() async {
    final faceImage = _faceImages.first;
    final encodedImage = imglib.encodeJpg(faceImage);

    if (context.mounted) {
      final result = await Dialogs.showConfirmDialog(
          context, const Text("Register face"), Image.memory(encodedImage));
      if (result != null && result) {
        widget.student!
            .registerFace(await _mlService.predict(faceImage), encodedImage)
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

  _takeAttendance() async {
    // Recognize students
    Map<Student, num> recognizedStudents = {};
    for (imglib.Image image in _faceImages) {
      List predictedArray = await _mlService.predict(image);
      final neighbor =
          _faceDataTree!.queryIterable(predictedArray.cast<num>(), 1);
      final threshold = prefs.getDouble('threshold')!;

      if (neighbor.first.distance <= threshold) {
        final student =
            _studentsWithRegisteredFaces.elementAt(neighbor.first.index);
        recognizedStudents.addAll({student: neighbor.first.distance});
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
      if (recognizedStudents[student] != null) {
        record = AttendanceRecord(
            studentId: student.id,
            classKey: widget.mClass!.key,
            dateTime: currentDateTime,
            status: AttendanceStatus.present);
      } else {
        record = AttendanceRecord(
            studentId: student.id,
            classKey: widget.mClass!.key,
            dateTime: currentDateTime,
            status: AttendanceStatus.absent);
      }

      HiveBoxes.attendancesBox().add(record);
    }

    // Display recognized students
    // TODO: yung gawa ni sam hehe
    if (context.mounted) {
      await Dialogs.showAlertDialog(
        context,
        const Text("Recognized students"),
        Text(recognizedStudents.entries
            .map((e) => "${e.key.toString()} (${e.value.toStringAsFixed(3)})")
            .cast<String>()
            .toList()
            .join('\n')),
      );
    }

    if (context.mounted) {
      Navigator.pop(context);
    }
  }

  void switchCamera() {
    setState(() => isUsingIPCamera = !isUsingIPCamera);
  }

  void capturePhoto(InputImage inputImage) async {
    await processCapturedImage(inputImage);

    if (widget.student != null) {
      _registerFace();
    } else {
      _takeAttendance();
    }
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

  _setupClassList() {
    _classStudents = widget.mClass!.getStudents();
    _studentsWithRegisteredFaces = [
      for (var student in _classStudents)
        if (student.faceArray != null) student
    ];

    List<List<num>> embeddings = [
      for (Student student in _studentsWithRegisteredFaces)
        student.faceArray!.cast<num>()
    ];
    _faceDataTree = KDTree.fromIterable(embeddings);
  }

  @override
  void initState() {
    super.initState();

    if (widget.mClass != null) {
      _setupClassList();
    }
  }

  @override
  Widget build(BuildContext context) => FaceRecognitionView(this);
}