import 'dart:typed_data';

import 'package:a_check/models/person.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:a_check/widgets/controllers/face_card_state.dart';
import 'package:flutter/material.dart';

class FaceCard extends StatefulWidget {
  const FaceCard(
      {super.key,
      required this.student,
      required this.faceImageBytes,
      required this.confidenceValue});

  final Student student;
  final Uint8List faceImageBytes;
  final num confidenceValue;

  @override
  State<FaceCard> createState() => FaceCardState();
}

class FaceCardView extends WidgetView<FaceCard, FaceCardState> {
  const FaceCardView(super.state, {super.key});

  Widget buildPhotoView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Image.memory(
            widget.faceImageBytes,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${widget.student.firstName[0]}. ${widget.student.lastName}",
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  widget.confidenceValue.toStringAsFixed(2),
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    fontWeight: FontWeight.w200,
                    fontStyle: FontStyle.normal,
                    fontSize: 10,
                    color: Color(0xff7c7c7c),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: state.onCardTap,
      child: Card(
        margin: const EdgeInsets.all(4),
        color: const Color(0xffffffff),
        shadowColor: const Color(0xff000000),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: buildPhotoView(),
        ),
      ),
    );
  }
}
