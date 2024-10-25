import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:trackcreditapp/data/repositories/product_repository.dart';
import 'package:trackcreditapp/utilities/constans/snackbars.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();
  final productRepo = Get.put(ProductRepository());
  final fetchedData = FirebaseFirestore.instance
      .collection('Products')
      .orderBy('Date', descending: true);

  Future<void> removeProduct(int index) async {
    try {
      AppSnackbars.defaultDialog(
        context: Get.context!,
        onConfirm: () async {
          AppSnackbars.loadingIndicator();
          await productRepo.removeProduct(index);
          Get.back();
          Get.back();
        },
      );
    } catch (e) {
      AppSnackbars.errorSnackBar(error: e.toString());
      Get.back();
    }
  }
}
