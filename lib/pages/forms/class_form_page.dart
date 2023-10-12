import 'package:a_check/models/class.dart';
import 'package:a_check/pages/forms/controllers/class_form_state.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:a_check/utils/textformatters.dart';
import 'package:a_check/utils/validators.dart';
import 'package:a_check/widgets/schedule_row.dart';
import 'package:flutter/material.dart';

class ClassFormPage extends StatefulWidget {
  const ClassFormPage({super.key, this.mClass});

  final Class? mClass;

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
            enabled: widget.mClass == null,
            validator: Validators.hasValue,
            controller: state.codeTedCon,
            obscureText: false,
            textAlign: TextAlign.start,
            inputFormatters: [UpperCaseTextFormatter()],
            textInputAction: TextInputAction.next,
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
            textInputAction: TextInputAction.next,
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
            enabled: widget.mClass == null,
            validator: Validators.hasValue,
            controller: state.sectionTedCon,
            obscureText: false,
            textAlign: TextAlign.start,
            textInputAction: TextInputAction.done,
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
      body: Form(
        key: state.formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Column(
              children: [buildClassInfo(), buildScheduleList()],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
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
                child: Text(
                  widget.mClass == null ? "Add Class" : "Edit Class",
                  style: const TextStyle(
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
    );
  }
}
