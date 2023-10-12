import 'dart:async';

import 'package:a_check/main.dart';
import 'package:a_check/widgets/ip_camera_view.dart';
import 'package:easy_onvif/onvif.dart' as onvif;
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class IPCameraState extends State<IPCameraWidget> {
  late final player = Player(
      configuration: const PlayerConfiguration(
    title: "IP Camera",
    osc: false,
  ));
  late final videoController = VideoController(player);
  late Future<void> initializePlayerFuture;

  void takeScreenshot() async {
    final screenshot = await player.screenshot();

    if (screenshot != null) widget.onScreenshot!(screenshot);
  }

  @override
  void initState() {
    super.initState();

    initializePlayerFuture = _connectToIPCam().then((value) {
      initializePlayerFuture = player.open(Media(value));
    }).onError((error, stackTrace) {
      initializePlayerFuture = player.open(Media(
          "https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4"));
    });
  }

  Future<String> _connectToIPCam() async {
    final host = prefs.getString('onvif_cam_addr');
    final username = prefs.getString('onvif_cam_username');
    final password = prefs.getString('onvif_cam_password');

    if (host == null) {
      throw Exception("OnvifCamNotSet");
    }

    final cam = await onvif.Onvif.connect(
            host: host, username: username, password: password)
        .timeout(const Duration(seconds: 5))
        .onError((error, stackTrace) =>
            throw TimeoutException("OnvifConnectionFailure"));

    var streamUri = await cam.media.getStreamUri(
        await cam.media.getProfiles().then((value) => value.first.token));
    return "${streamUri.substring(0, 7)}${prefs.getString('onvif_cam_username')}:${prefs.getString('onvif_cam_password')}@${streamUri.substring(7)}";
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => IPCameraView(this);
}
