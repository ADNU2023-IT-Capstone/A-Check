import 'package:a_check/auth.dart';
import 'package:a_check/firebase_options.dart';
import 'package:a_check/globals.dart';
import 'package:a_check/themes.dart';
// import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

// late List<CameraDescription> cameras;
late PackageInfo packageInfo;
late SharedPreferences prefs;

late final Auth auth;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = const Settings(
      persistenceEnabled: true, cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);

  // if (kDebugMode) {
  //   try {
  //     // !!! CHANGE IP AND PORT TO WHERE THE EMULATOR IS HOSTED !!!
  //     const ip = '192.168.137.1';

  //     print("Using local Firebase emulator");
  //     await FirebaseStorage.instance.useStorageEmulator(ip, 9199);
  //     FirebaseFirestore.instance.useFirestoreEmulator(ip, 8080);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // cameras = await availableCameras();
  packageInfo = await PackageInfo.fromPlatform();
  prefs = await SharedPreferences.getInstance();
  await setupDefaultPrefs();

  User? lastUser;
  if (prefs.containsKey('user')) {
    final values = prefs.getStringList('user')!;
    lastUser = User(id: values.first, schoolId: values[1], name: values.last);
  }
  auth = Auth(user: lastUser);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MainApp());
  });
}

Future<void> setupDefaultPrefs() async {
  if (!prefs.containsKey('threshold')) await prefs.setDouble('threshold', 1.5);
  if (!prefs.containsKey('absent_warn')) await prefs.setInt('absent_warn', 2);
  if (!prefs.containsKey('scan_interval')) await prefs.setInt('scan_interval', 2);
  if (!prefs.containsKey('late_value')) await prefs.setInt('late_value', 15);
  if (!prefs.containsKey('auto_email')) await prefs.setBool('auto_email', false);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      // theme: ThemeData(useMaterial3: true),
      scaffoldMessengerKey: snackbarKey,
      theme: Themes.main,
      home: const Scaffold(
        body: AuthGate(),
      ),
    );
  }
}
