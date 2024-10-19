import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackcreditapp/utilities/constans/colors.dart';
import 'package:trackcreditapp/utilities/constans/snackbars/error_snackbar.dart';

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

      if (!loginFormKey.currentState!.validate()) {
        Get.back();
        return;
      }
    } catch (e) {
      AppSnackbars.errorSnackBar(error: e.toString());
      Get.back();
    }
  }
}
