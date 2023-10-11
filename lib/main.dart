import 'package:a_check/globals.dart';
import 'package:a_check/splash.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

late List<CameraDescription> cameras;
late PackageInfo packageInfo;
late SharedPreferences prefs;

void main() async {
  await Hive.initFlutter();
  await HiveBoxes.initialize();
  cameras = await availableCameras();
  packageInfo = await PackageInfo.fromPlatform();
  prefs = await SharedPreferences.getInstance();
  await setupDefaultPrefs();

  runApp(const MainApp());
}

Future<void> setupDefaultPrefs() async {
  if (!prefs.containsKey('threshold')) await prefs.setDouble('threshold', 1.5);
  if (!prefs.containsKey('absent_limit')) await prefs.setInt('absent_limit', 3);
  if (!prefs.containsKey('absent_warn')) await prefs.setInt('absent_warn', 2);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      // theme: ThemeData(useMaterial3: true),
      scaffoldMessengerKey: snackbarKey,
      home: const Scaffold(
        body: SplashWidget(),
      ),
    );
  }
}