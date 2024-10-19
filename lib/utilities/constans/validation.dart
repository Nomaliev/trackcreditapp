import 'package:get/get.dart';
import 'package:trackcreditapp/features/authentication/controllers/signup_controller.dart';

class AppValidator {
  static String? validateEmptyField(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName tələb olunur.';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tələb olunur.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Keçərsiz email adresi.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Şifrə tələb olunur.';
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'Şifrə ən azı 6 xarakterdən ibarət olmalıdır.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Şifrə ən azı bir böyük hərfdən ibarət olmalıdır.';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Şifrə ən azı 1 rəqəmdən ibarət olmalıdır.';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Şifrə ən azı bir özəl xarakterdən ibarət olmalıdır.';
    }

    return null;
  }

  static String? validatePasswordConfirm(String? value) {
    if (value == null || value.isEmpty) {
      return 'Şifrə tələb olunur.';
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'Şifrə ən azı 6 xarakterdən ibarət olmalıdır.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Şifrə ən azı bir böyük hərfdən ibarət olmalıdır.';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Şifrə ən azı 1 rəqəmdən ibarət olmalıdır.';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Şifrə ən azı bir özəl xarakterdən ibarət olmalıdır.';
    }

    //Check if the passwords match
    if (Get.put(SignupController()).password.text.trim() !=
        Get.put(SignupController()).confirmPassword.text.trim()) {
      return "Şifrələr uyğun gəlmir.";
    }

    return null;
  }
}
