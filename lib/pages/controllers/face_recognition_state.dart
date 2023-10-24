import 'dart:io';

import 'package:a_check/globals.dart';
import 'package:a_check/main.dart';
import 'package:a_check/models/attendance_record.dart';
import 'package:a_check/models/student.dart';
import 'package:a_check/pages/face_detected_page.dart';
import 'package:a_check/pages/face_recognition_page.dart';
import 'package:a_check/utils/dialogs.dart';
import 'package:a_check/utils/face_detector_painter.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:a_check/utils/mlservice.dart';
import 'package:camera/camera.dart';
import 'package:convert_native_img_stream/convert_native_img_stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as imglib;
import 'package:ml_algo/kd_tree.dart';
import 'package:path_provider/path_provider.dart';

class FaceRecognitionState extends State<FaceRecognitionPage> {
  final _mlService = MLService();
  final _convertNative = ConvertNativeImgStream();
  List<Face> _detectedFaces = [];
  List<imglib.Image> _faceImages = [];
  List<Student> _classStudents = [], _studentsWithRegisteredFaces = [];
  KDTree? _faceDataTree;
  Map<Student, num> recognizedStudents = {};
  Map<Student, Uint8List> recognizedFaces = {};

  late bool _canRealtimeProcess;
  bool _isBusy = false;
  bool isUsingIPCamera = false;
  CustomPaint? customPaint;

  Future<bool> processCapturedImage(InputImage inputImage) async {
    if (!await _detectFacesFromInputImage(inputImage)) {
      return false;
    }
    if (!await _getFaceImages(inputImage)) {
      return false;
    }

    return true;
  }

  Future<bool> _detectFacesFromInputImage(InputImage inputImage) async {
    final faces = await _mlService.getFaces(inputImage);
    if (faces.isEmpty) {
      if (_canRealtimeProcess == false) {
        snackbarKey.currentState!.hideCurrentSnackBar();
        snackbarKey.currentState!
            .showSnackBar(const SnackBar(content: Text("No faces detected!")));
      }

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
      final jpegByte = await _convertNative.convertImgToBytes(
          inputImage.bytes!,
          inputImage.metadata!.size.width.toInt(),
          inputImage.metadata!.size.height.toInt());

      if (jpegByte != null) {
        photo = imglib.decodeJpg(jpegByte);
      } else {
        return false;
      }
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

  Future<bool> _recognizeFaces() async {
    recognizedStudents = {};
    recognizedFaces = {};

    if (_faceImages.isEmpty) return false;
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

    return true;
  }

  Future<void> _registerFace() async {
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

  Future<void> _takeAttendance() async {
    await _recognizeFaces();

    snackbarKey.currentState!.hideCurrentSnackBar();
    if (recognizedStudents.isEmpty) {
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
      // await Dialogs.showAlertDialog(
      //   context,
      //   const Text("Recognized students"),
      //   Text(recognizedStudents.entries
      //       .map((e) => "${e.key.toString()} (${e.value.toStringAsFixed(3)})")
      //       .cast<String>()
      //       .toList()
      //       .join('\n')),
      // );
      final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetectedFacesPage(
                recognizedStudents: recognizedStudents,
                recognizedFaces: recognizedFaces,
                studentsList: _studentsWithRegisteredFaces),
          ));
    }

    if (context.mounted) {
      Navigator.pop(context);
    }
  }

  void switchCamera() {
    setState(() => isUsingIPCamera = !isUsingIPCamera);
  }

  void capturePhoto(InputImage inputImage) async {
    snackbarKey.currentState!.showSnackBar(const SnackBar(
        content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text("Processing image..."), CircularProgressIndicator()],
    )));

    _canRealtimeProcess = false;
    await processCapturedImage(inputImage);
    snackbarKey.currentState!.hideCurrentSnackBar();

    if (widget.student != null) {
      snackbarKey.currentState!.showSnackBar(const SnackBar(
          content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text("Getting face..."), CircularProgressIndicator()],
      )));
      await _registerFace();
    } else {
      snackbarKey.currentState!.showSnackBar(const SnackBar(
          content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Getting recognized students..."),
          CircularProgressIndicator()
        ],
      )));
      await _takeAttendance();
    }

    _canRealtimeProcess = true;
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

  void processOnImage(
      InputImage inputImage, CameraLensDirection lensDirection) async {
    if (!_canRealtimeProcess || _isBusy) return;
    _isBusy = true;

    if (await _detectFacesFromInputImage(inputImage)) {
      if (inputImage.metadata?.size != null &&
          inputImage.metadata?.rotation != null) {
        final painter = FaceDetectorPainter(
          _detectedFaces,
          inputImage.metadata!.size,
          inputImage.metadata!.rotation,
          lensDirection,
        );
        customPaint = CustomPaint(painter: painter);
      }
    } else {
      customPaint = null;
    }

    _isBusy = false;
    if (mounted) {
      setState(() {});
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

    if (_studentsWithRegisteredFaces.isEmpty) {
      snackbarKey.currentState!.showSnackBar(const SnackBar(
          content: Text(
              "You do not have at least a student with a registered face!")));
      Navigator.pop(context);
    }

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

    _canRealtimeProcess = widget.isRealtime;
  }

  @override
  Widget build(BuildContext context) => FaceRecognitionView(this);
}
