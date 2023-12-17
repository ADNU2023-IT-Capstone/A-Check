import 'package:a_check/widgets/select_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Dialogs {
  static Future<void> showAlertDialog(
      BuildContext context, Widget title, Widget content) async {
    return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: title,
              content: content,
              actions: [
                MaterialButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text("Ok")),
              ],
            ));
  }

  static Future<bool?> showConfirmDialog(
      BuildContext context, Widget title, Widget content) async {
    return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: title,
              content: content,
              actions: [
                MaterialButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text("Yes")),
                MaterialButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text("No")),
              ],
            ));
  }

  static Future<String?> showTextInputDialog(BuildContext context, Widget title,
      {Widget? content,
      List<TextInputFormatter>? formatters,
      TextInputType? keyboardType,
      bool? obscureText}) async {
    TextEditingController textCon = TextEditingController();

    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: title,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (content != null) content,
            TextField(
              controller: textCon,
              inputFormatters: formatters,
              keyboardType: keyboardType,
              obscureText: obscureText ?? false,
            ),
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context, textCon.text);
            },
            child: const Text("Ok"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context, null);
            },
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  static Future<dynamic> showSelectDialog(
      BuildContext context, Map<String, dynamic> map,
      {Widget? title}) async {
    return await showDialog(
      context: context,
      builder: (context) => SelectDialog(
        title: title,
        map: map,
      ),
    );
  }
}
