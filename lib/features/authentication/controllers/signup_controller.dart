import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackcreditapp/data/repositories/authentication_repository.dart';
import 'package:trackcreditapp/data/repositories/user_repository.dart';
import 'package:trackcreditapp/features/authentication/models/user_model.dart';
import 'package:trackcreditapp/features/authentication/screens/loginpage/login_page.dart';
import 'package:trackcreditapp/utilities/constans/colors.dart';
import 'package:trackcreditapp/utilities/constans/snackbars/error_snackbar.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final hidePassword = true.obs;
  final hideConfirmPassword = true.obs;
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    try {
      showDialog(
          context: Get.context!,
          builder: (context) => const Center(
              child: CircularProgressIndicator.adaptive(
                  backgroundColor: AppColors.white)));
      if (!signupFormKey.currentState!.validate()) {
        Get.back();
        return;
      }

      UserCredential userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      final newUser =
          UserModel(id: userCredential.user!.uid, email: email.text.trim());

      final userRepo = Get.put(UserRepository());
      await userRepo.saveUserData(newUser);
      Get.offAll(() => const LoginPage());
    } catch (e) {
      AppSnackbars.errorSnackBar(error: e.toString());
      Get.back();
    }
  }
}
