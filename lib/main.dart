import 'package:a_check/splash.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

late List<CameraDescription> cameras;

void main() async {
  await Hive.initFlutter();
  await HiveBoxes.initialize();
  cameras = await availableCameras();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SplashWidget(),
      ),
    );
  }
}