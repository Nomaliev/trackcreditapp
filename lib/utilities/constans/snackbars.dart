import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trackcreditapp/utilities/constans/colors.dart';
import 'package:trackcreditapp/utilities/constans/sizes.dart';

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
    return ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: Row(
        children: [
          const Icon(Iconsax.warning_2),
          const SizedBox(width: AppSizes.fieldSpace),
          Text(
            warning,
            style: Theme.of(Get.context!)
                .textTheme
                .bodyMedium!
                .apply(color: AppColors.white),
          ),
        ],
      ),
      duration: const Duration(seconds: 2),
      width: 300,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.orange,
      elevation: 0,
    ));
  }

  static loadingIndicator() {
    return showDialog(
        context: Get.context!,
        builder: (context) => const Center(
            child: CircularProgressIndicator.adaptive(
                backgroundColor: AppColors.white)));
  }
}
