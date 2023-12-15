import 'package:a_check/globals.dart';
import 'package:a_check/main.dart';
import 'package:a_check/models/school.dart';
import 'package:a_check/pages/dashboard/settings_page.dart';
import 'package:a_check/utils/attendance_helpers.dart';
import 'package:a_check/utils/dialogs.dart';
import 'package:a_check/utils/email_helpers.dart';
import 'package:a_check/utils/onvif_helpers.dart';
import 'package:easy_onvif/probe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsState extends State<SettingsPage> {
  late bool? autoEmail;

  @override
  Widget build(BuildContext context) => SettingsView(this);

  @override
  void initState() {
    super.initState();

    autoEmail = prefs.getBool('auto_email');
  }

  void toggleEmailNotifs(bool? value) async {
    await prefs.setBool('auto_email', value ?? false);
    setState(() => autoEmail = value);
  }

  void setDistanceThreshold() async {
    final result = await Dialogs.showTextInputDialog(
        context, const Text("Enter new distance threshold value"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                "Higher values mean more strictness. Lower values mean less strictness."),
            const SizedBox(
              height: 8,
            ),
            Align(
                alignment: Alignment.center,
                child: Text("Current value: ${prefs.getDouble('threshold')}")),
          ],
        ),
        formatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*'))],
        keyboardType: TextInputType.number);

    if (result == null || result.isEmpty) return;

    prefs.setDouble('threshold', double.parse(result)).then((_) {
      snackbarKey.currentState!.showSnackBar(const SnackBar(
          content: Text("Successfully saved new distance threshold value!")));
    }).onError((error, stackTrace) {
      snackbarKey.currentState!.showSnackBar(SnackBar(
          content:
              Text("Something went horribly wrong!\n$error: $stackTrace")));
    });
  }

  void setScanInterval() async {
    final result = await Dialogs.showTextInputDialog(
        context, const Text("Enter new scan interval value"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Only accepts by seconds."),
            const SizedBox(
              height: 8,
            ),
            Align(
                alignment: Alignment.center,
                child: Text("Current value: ${prefs.getInt('scan_interval')}")),
          ],
        ),
        formatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number);

    if (result == null || result.isEmpty) return;

    prefs.setInt('scan_interval', int.parse(result)).then((_) {
      snackbarKey.currentState!.showSnackBar(const SnackBar(
          content: Text("Successfully saved new scan interval value!")));
    }).onError((error, stackTrace) {
      snackbarKey.currentState!.showSnackBar(SnackBar(
          content:
              Text("Something went horribly wrong!\n$error: $stackTrace")));
    });
  }

  void searchIPCam() async {
    int timeout = 10;

    snackbarKey.currentState!.showSnackBar(SnackBar(
      content: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Searching for cameras..."),
          CircularProgressIndicator()
        ],
      ),
      duration: Duration(seconds: timeout),
    ));
    final foundCameras =
        await OnvifHelpers.probeForCameras(timeout).whenComplete(() {
      snackbarKey.currentState!.hideCurrentSnackBar();
    }).onError((error, stackTrace) {
      return [];
    });

    if (foundCameras.isEmpty) {
      snackbarKey.currentState!.showSnackBar(
          const SnackBar(content: Text("Could not find any cameras.")));
      return;
    }

    Map<String, ProbeMatch> cams = {};
    for (var cam in foundCameras) {
      cams[cam.name] = cam;
    }

    ProbeMatch? cam;
    String? username, password;
    if (context.mounted) {
      cam = await Dialogs.showSelectDialog(context, cams,
          title: const Text("Select a camera"));
      if (cam == null) return;
    }

    if (context.mounted) {
      username = await Dialogs.showTextInputDialog(
          context, const Text("Enter username"));
      if (username == null) return;
    }

    if (context.mounted) {
      password = await Dialogs.showTextInputDialog(
          context, const Text("Enter password"),
          obscureText: true);
      if (password == null) return;
    }

    prefs.setString('onvif_cam_addr', cam!.xAddr);
    prefs.setString('onvif_cam_username', username!);
    prefs.setString('onvif_cam_password', password!);
    snackbarKey.currentState!.showSnackBar(
        SnackBar(content: Text("Successfully set IP camera to ${cam.name}!")));
  }

  void connectIPCam() async {
    final host = prefs.getString('onvif_cam_addr');
    final username = prefs.getString('onvif_cam_username');
    final password = prefs.getString('onvif_cam_password');
    if (host == null) {
      snackbarKey.currentState!.showSnackBar(
          const SnackBar(content: Text("You do not have an IP camera set!")));
      return;
    }

    snackbarKey.currentState!.showSnackBar(const SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Connecting to IP camera..."),
          CircularProgressIndicator()
        ],
      ),
      duration: Duration(seconds: 5),
    ));

    try {
      int timeout = 10;
      final onvif = await OnvifHelpers.connectToCamera(
              host: host,
              username: username!,
              password: password!,
              timeout: timeout)
          .whenComplete(() {
        snackbarKey.currentState!.hideCurrentSnackBar();
      });

      var deviceInfo = await onvif.deviceManagement.getDeviceInformation();
      snackbarKey.currentState!.showSnackBar(
          SnackBar(content: Text("Connected to ${deviceInfo.model}!")));
    } on OnvifException catch (ex) {
      snackbarKey.currentState!.hideCurrentSnackBar();
      snackbarKey.currentState!
          .showSnackBar(SnackBar(content: Text(ex.message ?? ex.code)));
      return;
    }
  }

  void logOut() async {
    await auth.signOut();

    snackbarKey.currentState!
        .showSnackBar(const SnackBar(content: Text("You have logged out.")));
  }

  changePassword() async {
    final input = await Dialogs.showTextInputDialog(
        context, const Text("Change password"),
        content: const Text(
            "Enter your new password. It should have at least 6 characters."),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true);

    if (input == null || input.isEmpty) {
      snackbarKey.currentState!
          .showSnackBar(const SnackBar(content: Text("Input a password!")));
      return;
    }

    if (input.length < 6) {
      snackbarKey.currentState!.showSnackBar(
          const SnackBar(content: Text("Password is too short!")));
      return;
    }

    await teachersRef
        .doc(auth.currentUser!.id)
        .update(password: input)
        .whenComplete(() {
      snackbarKey.currentState!
          .showSnackBar(const SnackBar(content: Text("Password changed!")));
    });
  }

  // manualNotify() async {
  //   final result = await Dialogs.showConfirmDialog(
  //       context,
  //       const Text("Confirm notify"),
  //       const Text(
  //           "Are you sure you want to notify all students who have reached maximum absences?"));

  //   if (result == true) {
  //     final classes = (await schoolRef.classes.whereTeacherId(isEqualTo: auth.currentUser!.id).get()).docs.map((e) => e.data).toList();
  //     for (var c in classes) {
  //       c.
  //     }
  //     AttendanceHelpers.sendEmail(schoolClass: schoolClass, student: student);
  //   }
  // }
}
