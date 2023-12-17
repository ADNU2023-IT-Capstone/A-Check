import 'package:a_check/models/school.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CorrectDialog extends StatefulWidget {
  const CorrectDialog({super.key, required this.students});

  final List<Student> students;

  @override
  State<CorrectDialog> createState() => _CorrectDialogState();
}

class _CorrectDialogState extends State<CorrectDialog> {
  Student? selectedStudent;

  void onDropdownChanged(Student? value) {
    setState(() => selectedStudent = value);
  }

  String? validateDropdown(Student? value) {
    if (value == null) {
      return "This field cannot be left blank!";
    }

    return null;
  }

  void finalize() {
    Navigator.pop(context, selectedStudent);
  }

  void delete() {
    Navigator.pop(context, false);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Correction"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
              "Select the correct student. Correcting will lock the student, ignoring any further detections!"),
          const SizedBox(height: 8),
          DropdownSearch<Student>(
            popupProps: const PopupProps.dialog(
                showSearchBox: true,
                showSelectedItems: false),
            items: widget.students,
            itemAsString: (item) => item.fullName,
            compareFn: (item1, item2) => item1.id == item2.id,
            selectedItem: selectedStudent,
            validator: validateDropdown,
            onChanged: onDropdownChanged,
          )
        ],
      ),
      actions: [
        MaterialButton(
          onPressed: finalize,
          child: const Text("Select"),
        ),
        MaterialButton(
          onPressed: delete,
          child: const Text("Delete"),
        ),
        MaterialButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}
