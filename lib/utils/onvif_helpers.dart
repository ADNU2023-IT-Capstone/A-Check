import 'dart:async';

import 'package:a_check/main.dart';
import 'package:easy_onvif/onvif.dart';

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
    final username = prefs.getString('onvif_cam_username');
    final password = prefs.getString('onvif_cam_password');

    if (host == null) {
      throw OnvifException("CamNotSet", "IP Camera not set");
    }

    final cam =
        await Onvif.connect(host: host, username: username, password: password)
            .timeout(const Duration(seconds: 5))
            .onError((error, stackTrace) => throw OnvifException(
                "ConnectionTimeout", "The connection to the camera timed out"));

    var streamUri = await cam.media.getStreamUri(
        await cam.media.getProfiles().then((value) => value.first.token));
    return "${streamUri.substring(0, 7)}${prefs.getString('onvif_cam_username')}:${prefs.getString('onvif_cam_password')}@${streamUri.substring(7)}";
  }
}
