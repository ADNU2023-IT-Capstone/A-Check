import 'dart:io';
import 'dart:typed_data';

import 'package:a_check/main.dart';
import 'package:a_check/models/school.dart';
import 'package:a_check/utils/mlservice.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:ml_algo/kd_tree.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as imglib;

class FaceMLHelpers {
  static Future<InputImage> bytesToInputImage(Uint8List bytes) async {
    final now = DateTime.now();
    final tempDir = await getTemporaryDirectory();
    var file =
        await File("${tempDir.path}/ip-cam-frame-screenshot-$now.jpg").create();
    file = await file.writeAsBytes(bytes);
    return InputImage.fromFile(file);
  }

  static Future<List<Face>> getFacesFromInputImage(
      InputImage inputImage, MLService ml) async {
    final faces = await ml.getFaces(inputImage);

    if (faces.isEmpty) {
      return <Face>[];
    }

    return faces;
  }

  static Future<List<imglib.Image>> getFaceImagesFromInputImage(
      InputImage inputImage, MLService ml) async {
    final faces = await getFacesFromInputImage(inputImage, ml);
    if (faces.isEmpty) {
      return [];
    }

    imglib.Image? photo;
    // photo from file
    if (inputImage.filePath != null && inputImage.filePath!.isNotEmpty) {
      final file = File(inputImage.filePath!);
      photo = await imglib.decodeImageFile(file.path);

      if (photo == null) return [];
      // photo from memory
    } else if (inputImage.bytes != null) {
      photo = imglib.Image.fromBytes(
          width: inputImage.metadata!.size.width.toInt(),
          height: inputImage.metadata!.size.height.toInt(),
          bytes: inputImage.bytes!.buffer);
    } else {
      return [];
    }

    return await ml.getFaceImages(faces, photo);
  }

  static Future<Map<String, num>?> recognizeFace(
      imglib.Image faceImage, KDTree embeddings, MLService ml) async {
    List points = await ml.predict(faceImage);

    final neighbor = embeddings.queryIterable(points.cast(), 1);
    final threshold = prefs.getDouble('threshold')!;

    if (neighbor.first.distance <= threshold) {
      return {
        "index": neighbor.first.index,
        "distance": neighbor.first.distance
      };
    }

    return null;
  }

  static Future<void> registerFace(
      String studentId, imglib.Image faceImage, MLService ml) async {
    return await studentsRef
        .doc(studentId)
        .update(faceArray: await ml.predict(faceImage));
  }
}
