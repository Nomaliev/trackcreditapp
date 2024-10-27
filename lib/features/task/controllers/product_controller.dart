import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackcreditapp/data/repositories/product_repository.dart';
import 'package:trackcreditapp/utilities/constans/helpers/network_manager.dart';
import 'package:trackcreditapp/utilities/constans/sizes.dart';
import 'package:trackcreditapp/utilities/constans/snackbars.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();
  final productRepo = Get.put(ProductRepository());
  final fetchedData = FirebaseFirestore.instance
      .collection('Products')
      .orderBy('Date', descending: true);
  Rx<int> currentIndex = AppSizes.infinite.obs;
  TextEditingController fieldText = TextEditingController();

  Future<void> removeProduct(int index) async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppSnackbars.warningSnackbar(warning: 'İnternetiniz Yoxdur');
        Get.back();
        return;
      }
      AppSnackbars.defaultDialog(
        context: Get.context!,
        onConfirm: () async {
          Get.back();
          await productRepo.removeProduct(index);
        },
      );
    } catch (e) {
      AppSnackbars.errorSnackBar(error: e.toString());
      Get.back();
    }
  }
}
