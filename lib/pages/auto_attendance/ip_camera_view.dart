import 'dart:async';
import 'dart:typed_data';

import 'package:a_check/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class IPCameraView extends StatefulWidget {
  const IPCameraView(
      {super.key, required this.url, this.onFrame, this.onCapture});

  final String url;
  final Function(Uint8List frameBytes)? onFrame;
  final Function(Uint8List frameBytes)? onCapture;

  @override
  State<IPCameraView> createState() => _IPCameraViewState();
}

class _IPCameraViewState extends State<IPCameraView> {
  late final VlcPlayerController _vlcController;
  late Timer? _timer;

  Future<Uint8List> _getCurrentFrame() async {
    return await _vlcController.takeSnapshot();
  }

  @override
  void initState() {
    super.initState();

    _vlcController = VlcPlayerController.network(widget.url, autoPlay: true);
    _vlcController.addOnInitListener(() {
      _vlcController.setVolume(0);
      if (widget.onFrame is Function) {
        _timer = Timer.periodic(
            Duration(seconds: prefs.getInt('scan_interval')!),
            (timer) async => widget.onFrame!(await _getCurrentFrame()));
      } else {
        _timer = null;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _timer?.cancel();
    _vlcController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onCapture is Function) {
      return Scaffold(
        body: Center(
            child: VlcPlayer(controller: _vlcController, aspectRatio: 16 / 9)),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            FloatingActionButton(
                onPressed: () async => widget.onCapture!(await _getCurrentFrame()),
                child: const Icon(Icons.camera)),
          ],
        ),
      );
    }

    return VlcPlayer(controller: _vlcController, aspectRatio: 16 / 9);
  }
}
