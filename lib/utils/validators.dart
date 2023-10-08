import 'package:email_validator/email_validator.dart';

class Validators {
  static String? hasValue(String? value) {
    if (value == null || value.isEmpty) {
      return "This field cannot be left blank!";
    }
    return null;
  }

  static String? isAMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "This field cannot be left blank!";
    }

    if (value.substring(0, 2) != "09") {
      return "Invalid mobile phone number!";
    }

    if (value.length != 11) {
      return "Mobile number is too short!";
    }

    return null;
  }

  static String? isAnEmail(String? value) {
    if (value != null ? !EmailValidator.validate(value) : true) {
      return "Invalid email!";
    }
    return null;
  }
}
