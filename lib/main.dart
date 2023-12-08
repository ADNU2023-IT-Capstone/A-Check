import 'package:a_check/firebase_options.dart';
import 'package:a_check/globals.dart';
import 'package:a_check/splash.dart';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:media_kit/media_kit.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

late List<CameraDescription> cameras;
late PackageInfo packageInfo;
late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED
  );

  if (kDebugMode) {
    try {
      print("Using local Firebase emulator");
      // !!! CHANGE IP AND PORT TO WHERE THE EMULATOR IS HOSTED !!!
      FirebaseFirestore.instance.useFirestoreEmulator('192.168.1.3', 8080);
    } catch (e) {
      print(e);
    }
  }

  MediaKit.ensureInitialized();
  cameras = await availableCameras();
  packageInfo = await PackageInfo.fromPlatform();
  prefs = await SharedPreferences.getInstance();
  await setupDefaultPrefs();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MainApp());
  });
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
