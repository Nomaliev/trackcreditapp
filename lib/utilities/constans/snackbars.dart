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
          const Icon(Iconsax.warning_2, color: Colors.orange),
          const SizedBox(width: AppSizes.fieldSpace),
          Text(
            warning,
            style: Theme.of(Get.context!)
                .textTheme
                .bodyMedium!
                .apply(color: AppColors.black),
          ),
        ],
      ),
      duration: const Duration(seconds: 2),
      width: 300,
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.white,
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

  static defaultDialog({
    required BuildContext context,
    String title = 'Təsdiqlə',
    String content = 'Bu məlumatı silmək istədiyinizə əminsiniz ?',
    String cancelText = 'İmtina',
    String confirmText = 'Sil',
    Function()? onCancel,
    Function()? onConfirm,
  }) {
    // Show a confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(AppSizes.defaultPadding),
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 70, 70, 70)),
              onPressed: onCancel ?? () => Get.back(),
              child: Text(cancelText,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: AppColors.white)),
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              onPressed: onConfirm,
              child: Text(confirmText,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: AppColors.white)),
            ),
          ],
        );
      },
    );
  }
}
