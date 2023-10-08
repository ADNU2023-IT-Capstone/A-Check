import 'package:a_check/pages/controllers/class_form_state.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:a_check/utils/textformatters.dart';
import 'package:a_check/utils/validators.dart';
import 'package:a_check/widgets/schedule_row.dart';
import 'package:flutter/material.dart';

// TODO: Input Validation

class ClassFormPage extends StatefulWidget {
  const ClassFormPage({super.key});

  @override
  State<ClassFormPage> createState() => ClassFormState();
}

class ClassFormView extends WidgetView<ClassFormPage, ClassFormState> {
  const ClassFormView(state, {Key? key}) : super(state, key: key);

  InputDecoration inputDecoration(String labelText) {
    return InputDecoration(
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(color: Colors.black26, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(color: Color(0xff000000), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(color: Color(0xff000000), width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Colors.red.shade400, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Colors.red.shade400, width: 2),
      ),
      labelText: labelText,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        color: Color(0xff000000),
      ),
      counterText: "",
      filled: true,
      fillColor: const Color(0xfff2f2f3),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    );
  }

  Widget buildClassInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text("Class Information",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            validator: Validators.hasValue,
            controller: state.codeTedCon,
            obscureText: false,
            textAlign: TextAlign.start,
            inputFormatters: [UpperCaseTextFormatter()],
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Color(0xff000000),
            ),
            decoration: inputDecoration("Class Code"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            validator: Validators.hasValue,
            controller: state.nameTedCon,
            obscureText: false,
            textAlign: TextAlign.start,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Color(0xff000000),
            ),
            decoration: inputDecoration("Class Name"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            validator: Validators.hasValue,
            controller: state.sectionTedCon,
            obscureText: false,
            textAlign: TextAlign.start,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Color(0xff000000),
            ),
            decoration: inputDecoration("Class Section"),
          ),
        ),
      ],
    );
  }

  Widget buildScheduleList() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Schedule",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ElevatedButton(
              onPressed: state.addSchedule,
              child: const Text("Add Schedule"),
            ),
          ],
        ),
        ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 8),
            children: state.schedules
                .map((e) => ScheduleRow(
                      schedule: e,
                      index: state.schedules.indexOf(e),
                      onEdit: state.editSchedule,
                      onDelete: state.deleteSchedule,
                    ))
                .toList())
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a class"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            top: 24,
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        physics: const ClampingScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height),
          child: Form(
            key: state.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [buildClassInfo(), buildScheduleList()],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: MaterialButton(
                    onPressed: state.addClass,
                    color: const Color(0xff000000),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side:
                          const BorderSide(color: Color(0xff808080), width: 1),
                    ),
                    padding: const EdgeInsets.all(16),
                    textColor: const Color(0xffffffff),
                    height: 40,
                    minWidth: 140,
                    child: const Text(
                      "Add Class",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
