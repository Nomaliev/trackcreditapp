import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
}
