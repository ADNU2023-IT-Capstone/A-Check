import 'dart:async';

import 'package:a_check/main.dart';
import 'package:easy_onvif/onvif.dart';
import 'package:easy_onvif/probe.dart';

class OnvifException implements Exception {
  String code;
  String? message;

  OnvifException(this.code, [this.message]);

  @override
  String toString() {
    return code;
  }
}

class OnvifHelpers {
  static Future<String> getCameraStreamUri() async {
    final host = prefs.getString('onvif_cam_addr');
    final username = prefs.getString('onvif_cam_username')!;
    final password = prefs.getString('onvif_cam_password')!;

    if (host == null) {
      throw OnvifException("CamNotSet", "IP Camera not set");
    }

    final cam = await connectToCamera(
        host: host, username: username, password: password);

    var streamUri = await cam.media.getStreamUri(
        await cam.media.getProfiles().then((value) => value.first.token));
    return "${streamUri.substring(0, 7)}${prefs.getString('onvif_cam_username')}:${prefs.getString('onvif_cam_password')}@${streamUri.substring(7)}";
  }

  static Future<List<ProbeMatch>> probeForCameras([int? timeout]) async {
    final prober = MulticastProbe(timeout: timeout ?? 5);
    await prober.probe();

    return prober.onvifDevices;
  }

  static Future<Onvif> connectToCamera(
      {required String host,
      required String username,
      required String password,
      int? timeout}) async {
    return await Onvif.connect(
            host: host, username: username, password: password)
        .timeout(Duration(seconds: timeout ?? 5),
            onTimeout: () => throw OnvifException(
                "ConnectionTimeout", "The connection to the camera timed out"))
        .onError((error, stackTrace) =>
            throw OnvifException(error.toString(), stackTrace.toString()));
  }
}
