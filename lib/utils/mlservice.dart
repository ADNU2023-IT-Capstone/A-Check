import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as imglib;

class MLService {
  late Interpreter _interpreter;
  final FaceDetector _faceDetector = FaceDetector(
      options: FaceDetectorOptions(performanceMode: FaceDetectorMode.accurate));

  _initializeInterpreter() async {
    Delegate? delegate;

    try {
      delegate = GpuDelegateV2();

      var interpreterOptions = InterpreterOptions()..addDelegate(delegate);
      _interpreter = await Interpreter.fromAsset('assets/mobilefacenet.tflite',
          options: interpreterOptions);
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to load model.\n$e");
    }
  }

  euclideanDistance(List l1, List l2) {
    double sum = 0;
    for (int i = 0; i < l1.length; i++) {
      sum += pow((l1[i] - l2[i]), 2);
    }

    return pow(sum, 0.5);
  }

  Float32List _imageToByteListFloat32(imglib.Image image) {
    var convertedBytes = Float32List(1 * 112 * 112 * 3);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;

    for (var i = 0; i < 112; i++) {
      for (var j = 0; j < 112; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = (pixel.r - 128) / 128;
        buffer[pixelIndex++] = (pixel.g - 128) / 128;
        buffer[pixelIndex++] = (pixel.b - 128) / 128;
      }
    }
    return convertedBytes.buffer.asFloat32List();
  }

  List _preProcess(imglib.Image image) {
    imglib.Image croppedImage = imglib.copyResizeCropSquare(image, size: 112);
    Float32List imageAsList = _imageToByteListFloat32(croppedImage);
    return imageAsList;
  }

  Future<List> predict(imglib.Image image) async {
    List input = _preProcess(image).reshape([1, 112, 112, 3]);
    List output = List.generate(1, (index) => List.filled(192, 0));

    await _initializeInterpreter();

    _interpreter.run(input, output);
    output = output.reshape([192]);

    return List.from(output);
  }

  Future<List<Face>> getFaces(InputImage inputImage) async {
    return await _faceDetector.processImage(inputImage);
  }

  Future<List<imglib.Image>> getFaceImages(
      List<Face> faces, File imageFile) async {
    if (faces.isEmpty) return List.empty();

    List<Map<String, int>> faceMaps = [];
    for (Face face in faces) {
      int x = face.boundingBox.left.toInt() - 10;
      int y = face.boundingBox.top.toInt() - 10;
      int w = face.boundingBox.width.toInt() + 10;
      int h = face.boundingBox.height.toInt() + 10;

      Map<String, int> thisMap = {'x': x, 'y': y, 'w': w, 'h': h};
      faceMaps.add(thisMap);
    }

    List<imglib.Image> faceImages = [];
    final bytes = await imageFile.readAsBytes();
    final decodedImage = imglib.decodeImage(bytes);
    for (Map<String, int> faceMap in faceMaps) {
      final faceCropImage = imglib.copyCrop(decodedImage!,
          x: faceMap['x']!,
          y: faceMap['y']!,
          width: faceMap['w']!,
          height: faceMap['h']!);

      faceImages.add(faceCropImage);
    }

    return faceImages;
  }
}
