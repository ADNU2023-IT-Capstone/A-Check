import 'package:a_check/models/school.dart';
import 'package:a_check/pages/class/class_page.dart';
import 'package:a_check/themes.dart';
import 'package:flutter/material.dart';

class ClassCard extends StatelessWidget {
  const ClassCard({Key? key, required this.mClass}) : super(key: key);

  final SchoolClass mClass;

  @override
  Widget build(BuildContext context) {
    const textColor = Color(0xffFFF4F4);

    void onTap() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ClassPage(classId: mClass.id)));
    }

    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Themes.main.colorScheme.primary,
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(30, 4, 30, 4),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(mClass.subjectCode,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              Divider(
                  height: 10,
                  thickness: 0.6,
                  color: Themes.main.colorScheme.onPrimary),
              const SizedBox(height: 10),
              Text(mClass.name,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w300)),
              const SizedBox(height: 10),
              Text(mClass.section,
                  style: const TextStyle(
                      color: textColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic)),
            ],
          ),
        ),
      ),
    );
  }
}
