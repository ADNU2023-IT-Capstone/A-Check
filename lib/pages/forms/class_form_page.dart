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
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide:
        const BorderSide(color: Color(0xff9e9e9e), width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide:
        const BorderSide(color: Colors.grey, width: 1),
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
      fillColor: const Color(0x00ffffff),
      isDense: false,
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    );
  }

  Widget buildClassInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
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
            decoration: inputDecoration("Code"),
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
            decoration: inputDecoration("Name"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
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
                color: Colors.black54,
            ),
            decoration: inputDecoration("Section"),
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
            TextButton(
              onPressed: state.addSchedule,
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Add Schedule', style: TextStyle(color: Colors.green),),
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
        centerTitle: true,
        title: const Text("Class Information"),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: state.addClass,
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Color(0xff557A46),Color(0xffffae77)]),
          ),
        ),

      ),
      body: Form(
        key: state.formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Column(
              children: [buildClassInfo(), buildScheduleList()],
            ),
          ],
        ),
      ),
    );
  }
}
