import 'dart:math';
import 'dart:typed_data';

import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as imglib;

class MLService {
  late Interpreter _interpreter;

  _initializeInterpreter() async {
    Delegate? delegate;

    try {
      delegate = GpuDelegateV2();

      var interpreterOptions = InterpreterOptions()..addDelegate(delegate);
      _interpreter = await Interpreter.fromAsset('assets/mobilefacenet.tflite',
          options: interpreterOptions);
    } catch (e) {
      print("Failed to load model.\n$e");
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
}
