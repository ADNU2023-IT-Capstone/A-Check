import 'package:a_check/models/class.dart';
import 'package:a_check/pages/class_page.dart';
import 'package:flutter/material.dart';

class ClassCard extends StatelessWidget {
  const ClassCard({Key? key, required this.mClass}) : super(key: key);

  final Class mClass;

  @override
  Widget build(BuildContext context) {
    void onTap() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ClassPage(classKey: mClass.key)));
    }

    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(50),
          ),
        ),
        child: Container(
            decoration: const BoxDecoration(color: Color(0xFFFFD3BE)),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.class_rounded, size: 24),
                  Text("${mClass.name} [${mClass.section}]"),
                  Text(mClass.code),
                ],
              ),
            )),
      ),
    );
  }
}
