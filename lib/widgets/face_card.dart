import 'dart:typed_data';

import 'package:a_check/models/school.dart';
import 'package:a_check/themes.dart';
import 'package:flutter/material.dart';

class FaceCard extends StatelessWidget {
  const FaceCard(
      {super.key,
      required this.student,
      required this.faceImageBytes,
      required this.distance,
      this.onTap});

  final Student student;
  final Uint8List faceImageBytes;
  final num distance;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: const Color(0xffffffff),
        shadowColor: const Color(0xff000000),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: buildPhotoView(),
      ),
    );
  }

  Widget buildPhotoView() {
    final textColor = Themes.main.colorScheme.onPrimaryContainer;

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Stack(alignment: Alignment.bottomCenter, children: [
            Image.memory(
              faceImageBytes,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: Themes.main.colorScheme.primaryContainer.withOpacity(0.4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "${student.firstName[0]}. ${student.lastName}",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: textColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          distance.toStringAsFixed(2),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                            fontSize: 10,
                            color: textColor,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ],
    );
  }
}
