// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;

enum EmailTemplate {
  student,
  guardian;

  static studentParams(
          {required String classCode,
          required String classSection,
          required String studentName,
          required String studentEmail,
          required String teacherName,
          required String teacherEmail}) =>
      {
        "class_code": classCode,
        "class_section": classSection,
        "student_name": studentName,
        "student_email": studentEmail,
        "teacher_name": teacherName,
        "teacher_email": teacherEmail,
      };

  static guardianParams(
          {required String classCode,
          required String classSection,
          required String guardianName,
          required String guardianEmail,
          required String studentName,
          required String teacherName,
          required String teacherEmail}) =>
      {
        "class_code": classCode,
        "class_section": classSection,
        "guardian_name": guardianName,
        "guardian_email": guardianEmail,
        "student_name": studentName,
        "teacher_name": teacherName,
        "teacher_email": teacherEmail,
      };

  @override
  String toString() {
    switch (this) {
      case student:
        return "template_cjxys09";
      case guardian:
        return "template_2ezt3fw";
    }
  }
}

class EmailHelpers {
  // TODO: EmailJS service and user ID, and access token should be set by class configuration
  // currently statically typed for prototype, for production should use user-provided info
  // or probably should be replaced with something that lets the user connect instead
  static const String _SERVICE_ID = "service_9r3tnyo";
  static const String _USER_ID = "tyEBTRfcIgRq0Rnf9";
  static const String _ACCESS_TOKEN = "OYDtjTcNS3GB8nDkJHJeA";
  static const Map<String, String> _HEADER = {
    'Content-Type': 'application/json'
  };

  static Future<http.Response> sendEmail(
      {required EmailTemplate template,
      required Map<String, String> params}) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    return http.post(url,
        headers: _HEADER,
        body: json.encode({
          'service_id': _SERVICE_ID,
          'template_id': template.toString(),
          'user_id': _USER_ID,
          'accessToken': _ACCESS_TOKEN,
          'template_params': params
        }));
  }
}
