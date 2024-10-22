import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackcreditapp/data/repositories/product_repository.dart';
import 'package:trackcreditapp/features/task/models/product_model.dart';
import 'package:trackcreditapp/features/task/screens/home.dart';
import 'package:trackcreditapp/utilities/constans/helpers/network_manager.dart';
import 'package:trackcreditapp/utilities/constans/snackbars.dart';

class AddCreditController extends GetxController {
  static AddCreditController get instance => Get.find();

  final productInput = TextEditingController();
  final productSizeInput = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> saveProductData() async {
    try {
      AppSnackbars.loadingIndicator();

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        Get.back();
        return;
      }

      if (!formKey.currentState!.validate()) {
        Get.back();
        return;
      }
      final newProduct = ProductModel(
          name: productInput.text.trim(), size: productSizeInput.text.trim());
      final productRepo = Get.put(ProductRepository());
      await productRepo.saveProductData(newProduct);
      Get.offAll(() => const HomePage());
    } catch (e) {
      AppSnackbars.errorSnackBar(error: e.toString());
      Get.back();
    }
  }
}
