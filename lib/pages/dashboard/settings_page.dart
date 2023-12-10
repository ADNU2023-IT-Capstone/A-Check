import 'package:a_check/pages/dashboard/controllers/settings_state.dart';
import 'package:a_check/themes.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => SettingsState();
}

class SettingsView extends WidgetView<SettingsPage, SettingsState> {
  const SettingsView(state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return buildSettingsList();
  }

  ListView buildSettingsList() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Settings",
            style: TextStyle(
                color: Themes.main.colorScheme.primary,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
        SettingsListTile(
          title: const Text("Search for IP camera"),
          onTap: state.searchIPCam,
        ),
        SettingsListTile(
          title: const Text("Test connection to IP camera"),
          onTap: state.connectIPCam,
        ),
        // Card(
        //   child: ListTile(
        //     title: const Text("Set absent warning value"),
        //     onTap: state.setAbsentWarning,
        //   ),
        // ),
        // TODO: sms notifs
        SettingsListTile(
          title: const Text("Automatic SMS notification"),
          subtitle: const Text(
              "If enabled, will notify the student and its guardian when absent warning and limit value is met through SMS"),
          trailing: Checkbox(
            value: false,
            onChanged: state.toggleSMSNotifs,
          ),
        ),
        // TODO: email notifs
        SettingsListTile(
          title: const Text("Automatic email notification"),
          subtitle: const Text(
              "If enabled, will notify the student and its guardian when absent warning and limit value is met through email"),
          trailing: Checkbox(
            value: false,
            onChanged: state.toggleEmailNotifs,
          ),
        ),
        SettingsListTile(
            title: const Text("Set distance threshold"),
            subtitle: const Text("Set how strict the face recognition will be"),
            onTap: state.setDistanceThreshold),
        SettingsListTile(
            title: const Text("Set IP camera scan interval"),
            subtitle: const Text(
                "Set how long the scan will wait before getting the next frame"),
            onTap: state.setScanInterval),
      ],
    );
  }
}

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    super.key,
    this.onTap,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
  });

  final Widget? title, subtitle, leading, trailing;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final tileColor = Themes.main.colorScheme.primaryContainer;
    final textColor = Themes.main.colorScheme.onPrimaryContainer;

    return Card(
      child: ListTile(
        title: title,
        subtitle: subtitle,
        leading: leading,
        trailing: trailing,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        onTap: onTap,
        tileColor: tileColor,
        textColor: textColor,
      ),
    );
  }
}
