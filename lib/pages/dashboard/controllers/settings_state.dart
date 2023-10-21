import 'package:a_check/globals.dart';
import 'package:a_check/main.dart';
import 'package:a_check/models/class.dart';
import 'package:a_check/pages/dashboard/settings_page.dart';
import 'package:a_check/utils/dialogs.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:easy_onvif/onvif.dart';
import 'package:easy_onvif/probe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// TODO: Bulk Add Students via CSV import

class SettingsState extends State<SettingsPage> {
  Widget _createConfirmDialog(Widget title, Widget content) {
    return AlertDialog(
      title: title,
      content: content,
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text("Yes")),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text("Cancel"))
      ],
    );
  }

  void clearAllClasses() {
    showDialog(
            context: context,
            builder: (context) => _createConfirmDialog(
                const Text("Clear All Classes"),
                const Text(
                    "Are you sure you want to delete ALL CLASSES? This is not recoverable!")))
        .then((value) {
      if (value == true) {
        HiveBoxes.classesBox().clear().then((value) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Cleared all classes.")));
        });
      }
    });
  }

  void clearAllAttendanceRecords() {
    showDialog(
            context: context,
            builder: (context) => _createConfirmDialog(
                const Text("Clear All Students"),
                const Text(
                    "Are you sure you want to delete ALL ATTENDANCE RECORDS? This is not recoverable!")))
        .then((value) {
      if (value == true) {
        HiveBoxes.attendancesBox().clear().then((value) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Cleared all attendance records.")));
        });
      }
    });
  }

  void clearAllStudents() {
    showDialog(
            context: context,
            builder: (context) => _createConfirmDialog(
                const Text("Clear All Students"),
                const Text(
                    "Are you sure you want to delete ALL STUDENTS? This is not recoverable!")))
        .then((value) {
      if (value == true) {
        HiveBoxes.studentsBox().clear().then((value) {
          HiveBoxes.classesBox().values.forEach((element) {
            final c = element as Class;
            c.studentIds.clear();
            c.save();
          });

          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Cleared all students.")));
        });
      }
    });
  }

  void setAbsentWarning() async {
    final result = await Dialogs.showTextInputDialog(
        context, const Text("Enter new absent warning value"),
        content: Text("Current value: ${prefs.getInt('absent_warn')}"),
        formatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number);

    if (result == null || result.isEmpty) return;

    prefs.setInt('absent_warn', int.parse(result)).then((_) {
      snackbarKey.currentState!.showSnackBar(const SnackBar(
          content: Text("Successfully saved new absent warning value!")));
    }).onError((error, stackTrace) {
      snackbarKey.currentState!.showSnackBar(SnackBar(
          content:
              Text("Something went horribly wrong!\n$error: $stackTrace")));
    });
  }

  void setAbsentLimit() async {
    final result = await Dialogs.showTextInputDialog(
        context, const Text("Enter new absent limit value"),
        content: Text("Current value: ${prefs.getInt('absent_limit')}"),
        formatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number);

    if (result == null || result.isEmpty) return;

    prefs.setInt('absent_limit', int.parse(result)).then((_) {
      snackbarKey.currentState!.showSnackBar(const SnackBar(
          content: Text("Successfully saved new absent limit value!")));
    }).onError((error, stackTrace) {
      snackbarKey.currentState!.showSnackBar(SnackBar(
          content:
              Text("Something went horribly wrong!\n$error: $stackTrace")));
    });
  }

  void toggleSMSNotifs(bool? value) {}

  void toggleEmailNotifs(bool? value) {}

  void setDistanceThreshold() async {
    final result = await Dialogs.showTextInputDialog(
        context, const Text("Enter new distance threshold value"),
        content: Text("Current value: ${prefs.getDouble('threshold')}"),
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

  void searchIPCam() async {
    final prober = MulticastProbe(timeout: 5);
    snackbarKey.currentState!.showSnackBar(const SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Searching for cameras..."),
          CircularProgressIndicator()
        ],
      ),
      duration: Duration(seconds: 5),
    ));
    await prober.probe();

    snackbarKey.currentState!.hideCurrentSnackBar();
    if (prober.onvifDevices.isEmpty) {
      snackbarKey.currentState!.showSnackBar(
          const SnackBar(content: Text("Could not find any cameras.")));
      return;
    }

    Map<String, ProbeMatch> cams = {};
    for (var cam in prober.onvifDevices) {
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
      final onvif = await Onvif.connect(
              host: host, username: username, password: password)
          .timeout(const Duration(seconds: 5))
          .onError(
              (error, stackTrace) => throw Exception("OnvifConnectionFailure"));

      snackbarKey.currentState!.hideCurrentSnackBar();
      var deviceInfo = await onvif.deviceManagement.getDeviceInformation();
      snackbarKey.currentState!.showSnackBar(
          SnackBar(content: Text("Connected to ${deviceInfo.model}!")));
    } catch (ex) {
      snackbarKey.currentState!.hideCurrentSnackBar();
      snackbarKey.currentState!.showSnackBar(
          const SnackBar(content: Text("Failed to connect to IP camera")));
      return;
    }
  }

  @override
  Widget build(BuildContext context) => SettingsView(this);
}
