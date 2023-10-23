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
        color: const Color(0xff557A46),
        clipBehavior: Clip.antiAliasWithSaveLayer,
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
            Text(mClass.code,
                maxLines: 2,
                overflow: TextOverflow.ellipsis, style: const TextStyle(color:Color(0xffFFF4F4),fontSize: 18, fontWeight: FontWeight.w500)),
            const Divider(height: 10,thickness: 0.5, color: Color(0xffF1C376)),
            const SizedBox(height: 10),
            Text(mClass.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color:Color(0xffFFF4F4),fontSize: 14, fontWeight: FontWeight.w300)),
            const SizedBox(height: 10),
            Text(mClass.section, style: const TextStyle(color:Color(0xffF7E6C4),fontSize: 12, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic)),
          ],
          ),
        ),
      ),
    );
  }
}
