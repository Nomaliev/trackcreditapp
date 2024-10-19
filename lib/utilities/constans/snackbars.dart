import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trackcreditapp/utilities/constans/colors.dart';

class AppSnackbars {
  static errorSnackBar({required error}) {
    return ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: const Duration(seconds: 3),
        content: Container(
          padding: const EdgeInsets.all(24.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            error,
            style: Theme.of(Get.context!)
                .textTheme
                .titleSmall!
                .apply(fontFamily: '', color: Colors.red),
            textAlign: TextAlign.left,
          ),
        )));
  }

  static warningSnackbar({required warning}) {
    Get.snackbar(
      warning,
      '',
      maxWidth: 600,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: AppColors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: AppColors.white),
    );
  }
}
