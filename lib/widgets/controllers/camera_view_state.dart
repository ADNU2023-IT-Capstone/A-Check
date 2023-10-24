import 'package:a_check/main.dart';
import 'package:a_check/widgets/camera_view.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class CameraViewState extends State<CameraViewWidget>
    with WidgetsBindingObserver {
  late CameraController? cameraController;
  late Future<void> initCameraControllerFuture;
  late final bool _hasOnImage;
  bool takingPicture = false;
  var savedCamDesc = cameras.first;

  final _orientations = {
    DeviceOrientation.portraitUp: 0,
    DeviceOrientation.landscapeLeft: 90,
    DeviceOrientation.portraitDown: 180,
    DeviceOrientation.landscapeRight: 270,
  };

  void takePicture() async {
    takingPicture = true;
    final photo = await cameraController!.takePicture().then((value) {
      takingPicture = false;
      return value;
    });
    final inputImage = InputImage.fromFilePath(photo.path);

    widget.onCapture!(inputImage);
  }

  void _processCameraImage(CameraImage cameraImage) {
    final inputImage = _convertToInputImage(cameraImage);

    if (inputImage != null) {
      widget.onImage!(inputImage, savedCamDesc.lensDirection);
    }
  }

  InputImage? _convertToInputImage(CameraImage cameraImage) {
    final sensorOrientation = savedCamDesc.sensorOrientation;

    var rotationCompensation =
        _orientations[cameraController!.value.deviceOrientation];
    if (rotationCompensation == null) return null;
    if (savedCamDesc.lensDirection == CameraLensDirection.front) {
      rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
    } else {
      rotationCompensation =
          (sensorOrientation - rotationCompensation + 360) % 360;
    }
    final rotation = InputImageRotationValue.fromRawValue(rotationCompensation);
    if (rotation == null) return null;

    final format = InputImageFormatValue.fromRawValue(cameraImage.format.raw);
    if (format == null) return null;

    if (cameraImage.planes.length != 1) return null;
    final plane = cameraImage.planes.first;

    return InputImage.fromBytes(
        bytes: plane.bytes,
        metadata: InputImageMetadata(
            size: Size(
                cameraImage.width.toDouble(), cameraImage.height.toDouble()),
            rotation: rotation,
            format: format,
            bytesPerRow: plane.bytesPerRow));
  }

  void switchCamera() {
    final currentLensDesc = cameraController!.description.lensDirection;
    CameraDescription newDesc;

    if (currentLensDesc == CameraLensDirection.front) {
      newDesc = cameras
          .firstWhere((desc) => desc.lensDirection == CameraLensDirection.back);
    } else {
      newDesc = cameras.firstWhere(
          (desc) => desc.lensDirection == CameraLensDirection.front);
    }

    setState(() => savedCamDesc = newDesc);
    _initCamera();
  }

  void _initCamera() {
    final controller = CameraController(savedCamDesc, ResolutionPreset.high,
        enableAudio: false, imageFormatGroup: ImageFormatGroup.nv21);

    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
      if (controller.value.hasError) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text("Camera initialization error!"),
                  content: Text(controller.value.errorDescription.toString()),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Ok")),
                  ],
                ));
      }
    });
    cameraController = controller;
    initCameraControllerFuture = cameraController!.initialize().then((_) {
      if (_hasOnImage) cameraController!.startImageStream(_processCameraImage);
    });
  }

  bool isInitialized() {
    if (cameraController != null && cameraController!.value.isInitialized) {
      return true;
    }

    return false;
  }

  @override
  void initState() {
    super.initState();
    _initCamera();
    WidgetsBinding.instance.addObserver(this);

    _hasOnImage = widget.onImage is Function;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      if (cameraController!.value.isStreamingImages) {
        cameraController!.stopImageStream();
      }
      cameraController?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      if (cameraController != null) {
        _initCamera();
        if (mounted) setState(() {});
      }
    }
  }

  Future<bool> onWillPop() async {
    if (cameraController!.value.isStreamingImages) {
      cameraController!.stopImageStream();
    }
    return true;
  }

  @override
  void dispose() {
    cameraController!.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CameraView(this);
}
