import 'package:a_check/globals.dart';
import 'package:a_check/main.dart';
import 'package:a_check/models/class.dart';
import 'package:a_check/pages/settings_page.dart';
import 'package:a_check/utils/dialogs.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:easy_onvif/onvif.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      snackbarKey.currentState!.showSnackBar(const SnackBar(content: Text("Successfully saved new absent warning value!")));
    }).onError((error, stackTrace) {
      snackbarKey.currentState!.showSnackBar(SnackBar(content: Text("Something went horribly wrong!\n$error: $stackTrace")));
    });
  }

  void toggleSMSNotifs() {
    
  }

  void toggleEmailNotifs() {
    
  }

  void setAbsentLimit() async {
    final result = await Dialogs.showTextInputDialog(
        context, const Text("Enter new absent limit value"),
        content: Text("Current value: ${prefs.getInt('absent_limit')}"),
        formatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number);

    if (result == null || result.isEmpty) return;

    prefs.setInt('absent_limit', int.parse(result)).then((_) {
      snackbarKey.currentState!.showSnackBar(const SnackBar(content: Text("Successfully saved new absent limit value!")));
    }).onError((error, stackTrace) {
      snackbarKey.currentState!.showSnackBar(SnackBar(content: Text("Something went horribly wrong!\n$error: $stackTrace")));
    });
  }

  void setDistanceThreshold() async {
    final result = await Dialogs.showTextInputDialog(
        context, const Text("Enter new distance threshold value"),
        content: Text("Current value: ${prefs.getDouble('threshold')}"),
        formatters: [FilteringTextInputFormatter.allow("[0-9\\.]")],
        keyboardType: TextInputType.number);

    if (result == null || result.isEmpty) return;

    prefs.setDouble('threshold', double.parse(result)).then((_) {
      snackbarKey.currentState!.showSnackBar(const SnackBar(content: Text("Successfully saved new distance threshold value!")));
    }).onError((error, stackTrace) {
      snackbarKey.currentState!.showSnackBar(SnackBar(content: Text("Something went horribly wrong!\n$error: $stackTrace")));
    });
  }

  void connectToIpCam() async {
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

    List<String> cams = [];
    for (var cam in prober.onvifDevices) {
      cams.add("${cam.name} ${cam.xAddr}");
    }

    if (context.mounted) {
      Dialogs.showAlertDialog(
          context, const Text("Found cameras!"), Text(cams.join('\n')));
    }
  }

  @override
  Widget build(BuildContext context) => SettingsView(this);
}
