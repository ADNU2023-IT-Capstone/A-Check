import 'dart:typed_data';
import 'package:a_check/models/school.dart';
import 'package:image/image.dart' as imglib;

class RecognizedStudent {
  Student student;
  num distance;
  imglib.Image faceImage;
  bool locked = false;

  late int occurences;

  RecognizedStudent(
      {required this.student,
      required this.distance,
      required this.faceImage,
      int? occurences}) {
    this.occurences = occurences ?? 1;
  }

  Uint8List get jpegBytes {
    return imglib.encodeJpg(faceImage, quality: 50);
  }
}
