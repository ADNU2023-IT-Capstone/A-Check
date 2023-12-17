import 'dart:io';

import 'package:a_check/globals.dart';
import 'package:a_check/models/recognized_student.dart';
import 'package:a_check/models/school.dart';
import 'package:a_check/pages/forms/attendance_records_form.dart';
import 'package:a_check/utils/dialogs.dart';
import 'package:a_check/utils/face_ml_helpers.dart';
import 'package:a_check/utils/mlservice.dart';
import 'package:a_check/utils/onvif_helpers.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as imglib;
import 'package:ml_algo/kd_tree.dart';
import 'package:path_provider/path_provider.dart';

import '../face_detected_page.dart';
import '../face_recognition_page.dart';

class FaceRecognitionState extends State<FaceRecognitionPage> {
  late Future<void> waitForSetup;
  Map<String, RecognizedStudent> recognizedStudents = {};
  bool isUsingIPCamera = false;

  @override
  void initState() {
    super.initState();

    if (widget.schoolClass != null) {
      waitForSetup = _setupClassList();
    } else {
      waitForSetup = Future.value();
    }
  }

  @override
  void dispose() {
    super.dispose();

    _mlService.dispose();
  }

  @override
  Widget build(BuildContext context) => FaceRecognitionView(this);

  Future<String?> connectToCamera() async {
    try {
      return await OnvifHelpers.getCameraStreamUri();
    } on OnvifException catch (ex) {
      snackbarKey.currentState!
          .showSnackBar(SnackBar(content: Text(ex.message ?? "Error! $ex")));
      setState(() => isUsingIPCamera = false);
    }

    return null;
  }

  void capturePhoto(InputImage inputImage) async {
    final bool result = await _processInputImage(inputImage);

    if (!result) {
      // error occured, do nothing
      return;
    }

    if (widget.student != null) {
      await _registerFace();
    } else {
      await _takeAttendance();
    }
  }

  void captureScreenshot(Uint8List frameBytes) async {
    snackbarKey.currentState!.showSnackBar(const SnackBar(
        content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text("Capturing screenshot..."), CircularProgressIndicator()],
    )));

    final inputImage = await FaceMLHelpers.bytesToInputImage(frameBytes);

    snackbarKey.currentState!.hideCurrentSnackBar();
    capturePhoto(inputImage);
  }

  void takePhoto(CameraState camState) async {
    final camera = camState as PhotoCameraState;

    try {
      await camera.takePhoto(
          onPhoto: (captureRequest) {
            final request = captureRequest as SingleCaptureRequest;

            capturePhoto(InputImage.fromFilePath(request.file!.path));
          },
          onPhotoFailed: (ex) => throw ex);
    } on Exception catch (ex) {
      snackbarKey.currentState!
          .showSnackBar(SnackBar(content: Text(ex.toString())));
    }
  }

  Future<CaptureRequest> photoPathBuilder(List<Sensor> sensors) async {
    final tempDir = await getTemporaryDirectory();
    final picsDir =
        await Directory("${tempDir.path}/camerawesome").create(recursive: true);
    final filePath =
        "${picsDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg";

    return SingleCaptureRequest(filePath, sensors.first);
  }

  void switchToIPCamera() async {
    setState(() => isUsingIPCamera = !isUsingIPCamera);
  }

  void manualAttendance() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AttendanceFormPage(
            students: _classStudents,
            classId: widget.schoolClass!.id,
          ),
        ));
  }

  final _mlService = MLService();
  late final List<Student> _classStudents, _registeredStudents;
  late final KDTree _faceEmbeddings;
  late List<imglib.Image> _faceImages;
  // List<imglib.Image> _faceImages = [];
  // List<Student> _classStudents = [], _studentsWithRegisteredFaces = [];
  // KDTree? _faceDataTree;

  Future<void> _setupClassList() async {
    _classStudents = await widget.schoolClass!.getStudents();
    _registeredStudents = [
      for (var student in _classStudents)
        if (student.faceArray.isNotEmpty) student
    ];

    List<List<num>> embeddings = [
      for (Student student in _registeredStudents) student.faceArray.cast<num>()
    ];
    _faceEmbeddings = KDTree.fromIterable(embeddings);
  }

  Future<bool> _processInputImage(InputImage inputImage) async {
    snackbarKey.currentState!.showSnackBar(const SnackBar(
        content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text("Processing image..."), CircularProgressIndicator()],
    )));

    return await _getFaceImagesFromInputImage(inputImage);
  }

  Future<bool> _getFaceImagesFromInputImage(InputImage inputImage) async {
    final faces =
        await FaceMLHelpers.getFaceImagesFromInputImage(inputImage, _mlService);

    if (faces.isEmpty) {
      snackbarKey.currentState!.hideCurrentSnackBar();
      snackbarKey.currentState!
          .showSnackBar(const SnackBar(content: Text("No faces detected!")));
      return false;
    }

    _faceImages = List.from(faces);
    return true;
  }

  Future<void> _registerFace() async {
    final faceImage = _faceImages.first;
    final encodedImage = imglib.encodeJpg(faceImage);
    final bool? result = await Dialogs.showConfirmDialog(
        context, const Text("Register face"), Image.memory(encodedImage));

    if (result == true) {
      FaceMLHelpers.registerFace(
              widget.student!.id, _faceImages.first, _mlService)
          .then((value) {
        snackbarKey.currentState!.hideCurrentSnackBar();
        Navigator.pop(context, true);
      });
    }
  }

  Future<void> _takeAttendance() async {
    // iterate through faces images...
    for (var face in _faceImages) {
      final faceMap =
          await FaceMLHelpers.recognizeFace(face, _faceEmbeddings, _mlService);

      // ...if it recognized a person
      if (faceMap != null) {
        final student = _registeredStudents[faceMap['index']! as int];
        final distance = faceMap['distance']!;
        RecognizedStudent? rs;

        // ...if student was already recognized
        if (recognizedStudents.containsKey(student.id)) {
          rs = recognizedStudents[student.id]!;

          if (distance > rs.distance) {
            // distance too far; ignore
            continue;
          }

          rs.distance = distance;
          rs.faceImage = face;
        }

        // ...add to recognized students map
        recognizedStudents[student.id] = rs ??
            RecognizedStudent(
                student: student, distance: distance, faceImage: face);
      }
    }

    if (recognizedStudents.isEmpty) {
      snackbarKey.currentState!.hideCurrentSnackBar();
      snackbarKey.currentState!.showSnackBar(
          const SnackBar(content: Text("No recognized students!")));
      return;
    }

    // Display recognized students
    if (context.mounted) {
      snackbarKey.currentState!.hideCurrentSnackBar();
      await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DetectedFacesPage(
                schoolClass: widget.schoolClass!,
                recognizedStudents: recognizedStudents,
                classStudents: _classStudents),
          ));
    }
  }
}
