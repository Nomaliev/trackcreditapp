import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackcreditapp/data/repositories/authentication_repository.dart';
import 'package:trackcreditapp/features/task/screens/home.dart';
import 'package:trackcreditapp/utilities/constans/colors.dart';
import 'package:trackcreditapp/utilities/constans/helpers/network_manager.dart';
import 'package:trackcreditapp/utilities/constans/snackbars.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  Future<void> login() async {
    try {
      showDialog(
          context: Get.context!,
          builder: (context) => const Center(
              child: CircularProgressIndicator.adaptive(
                  backgroundColor: AppColors.white)));

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        Get.back();
        return;
      }

      if (!loginFormKey.currentState!.validate()) {
        Get.back();
        return;
      }

      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      Get.offAll(() => const HomePage());
    } catch (e) {
      AppSnackbars.errorSnackBar(error: e.toString());
      Get.back();
    }
  }
}
