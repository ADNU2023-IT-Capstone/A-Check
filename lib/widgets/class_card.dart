import 'package:a_check/models/class.dart';
import 'package:a_check/pages/class/class_page.dart';
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
        elevation: 2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Container(
            decoration: const BoxDecoration(color: Colors.white12),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(30, 4, 30, 4),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(mClass.code,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  const Divider(height: 20,thickness: 0.5, color: Colors.green),
                  const SizedBox(height: 10),
                  Text(mClass.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
                  const SizedBox(height: 10),
                  Text(mClass.section, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300, fontStyle: FontStyle.italic)),
                ],
              ),
            )),
      ),
    );
  }
}
