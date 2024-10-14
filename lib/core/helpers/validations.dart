import 'package:flutter/cupertino.dart';

import '../constants/app_strings.dart';
import 'app_regexp.dart';
abstract class Validations {
  static String? validateName(BuildContext context, String? name) {
    if (name!.isEmpty || !AppRegExp.isNameValid(name)) {
      return AppStrings.nameRequired;
    }
    return null;
  }

  static String? validateEmail(BuildContext context, String? email) {
    if (email!.isEmpty || !AppRegExp.isEmailValid(email)) {
      return AppStrings.emailRequired;
    } else if (!email.contains('@')) {
      return AppStrings.invalidEmail;
    }
    return null;
  }

  static String? validatePhoneNumber(
      BuildContext context, String? phoneNumber) {
    if (phoneNumber!.isEmpty || !AppRegExp.isPhoneNumberValid(phoneNumber)) {
      return AppStrings.phoneNumberRequired;
    }
    return null;
  }

  static String? validatePassword(BuildContext context, String? password) {
    if (password!.isEmpty || !AppRegExp.isPasswordValid(password)) {
      return AppStrings.passwordRequired;
    }
    return null;
  }

  static String? validateConfirmPassword(
      BuildContext context, String? password, String? confirmPassword) {
    if (confirmPassword!.isEmpty ||
        !AppRegExp.isPasswordValid(confirmPassword)) {
      return AppStrings.confirmPasswordRequired;
    } else if (password != confirmPassword) {
      return AppStrings.passwordsMustMatch;
    }
    return null;
  }

  static String? validateOTP(BuildContext context, String? otp) {
    if (otp!.isEmpty || !AppRegExp.isOTPValid(otp)) {
      return AppStrings.otpRequired;
    }
    return null;
  }

  static String? validateUsername(BuildContext context, String? username) {
    if (username!.isEmpty || !AppRegExp.isUsernameValid(username)) {
      return AppStrings.usernameRequired;
    }
    return null;
  }
}

