import 'package:a_check/widgets/select_dialog.dart';
import 'package:flutter/material.dart';

class SelectDialogState extends State<SelectDialog> {
  void onOptionSelect(value) {
    Navigator.pop(context, value);
  }
  
  @override
  Widget build(BuildContext context) => SelectDialogView(this);
}