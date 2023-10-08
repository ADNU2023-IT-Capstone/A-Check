import 'package:a_check/splash.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';

late List<CameraDescription> cameras;
late PackageInfo packageInfo;

void main() async {
  await Hive.initFlutter();
  await HiveBoxes.initialize();
  cameras = await availableCameras();
  packageInfo = await PackageInfo.fromPlatform();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      // theme: ThemeData(useMaterial3: true),
      home: const Scaffold(
        body: SplashWidget(),
      ),
    );
  }
}