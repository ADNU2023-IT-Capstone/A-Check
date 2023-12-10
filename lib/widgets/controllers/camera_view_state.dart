import 'package:a_check/main.dart';
import 'package:a_check/widgets/camera_view.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class CameraViewState extends State<CameraViewWidget>
    with WidgetsBindingObserver {
  late CameraController? camCon;
  late Future<void> initializeCamConFuture;
  bool takingPicture = false;
  var savedCamDesc = cameras.first;

  @override
  Widget build(BuildContext context) => CameraView(this);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _initializeCameraController();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = camCon;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initializeCameraController();
    }
  }

  @override
  void dispose() {
    camCon!.dispose();
    super.dispose();
  }

  void takePicture() async {
    takingPicture = true;
    final photo = await camCon!.takePicture().then((value) {
      takingPicture = false;
      return value;
    });
    final inputImage = InputImage.fromFilePath(photo.path);

    widget.onCapture!(inputImage);
  }

  void switchCamera() {
    final currentLensDesc = camCon!.description.lensDirection;
    CameraDescription newDesc;

    if (currentLensDesc == CameraLensDirection.front) {
      newDesc = cameras
          .firstWhere((desc) => desc.lensDirection == CameraLensDirection.back);
    } else {
      newDesc = cameras.firstWhere(
          (desc) => desc.lensDirection == CameraLensDirection.front);
    }

    setState(() => savedCamDesc = newDesc);
    _initializeCameraController();
  }

  void _initializeCameraController() {
    final controller = CameraController(savedCamDesc, ResolutionPreset.veryHigh,
        enableAudio: false);
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

    camCon = controller;
    initializeCamConFuture = camCon!.initialize().then((value) {
      // camCon!.startImageStream((image) => widget.onImage);
    });
  }
}
