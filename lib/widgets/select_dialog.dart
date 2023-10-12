import 'package:a_check/utils/abstracts.dart';
import 'package:a_check/widgets/controllers/select_dialog_state.dart';
import 'package:flutter/material.dart';

class SelectDialog extends StatefulWidget {
  const SelectDialog({Key? key, this.title, required this.map})
      : super(key: key);

  final Widget? title;
  final Map<String, dynamic> map;

  @override
  State<SelectDialog> createState() => SelectDialogState();
}

class SelectDialogView extends WidgetView<SelectDialog, SelectDialogState> {
  const SelectDialogView(state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: widget.title,
      children: widget.map.entries
          .map((e) => SimpleDialogOption(
                onPressed: () => state.onOptionSelect(e.value),
                child: Text(e.key),
              ))
          .toList(),
    );
  }
}
