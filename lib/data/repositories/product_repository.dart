import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trackcreditapp/features/task/models/product_model.dart';
import 'package:trackcreditapp/utilities/constans/exceptions/firebase_exceptions.dart';
import 'package:trackcreditapp/utilities/constans/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveProductData(ProductModel product) async {
    try {
      CollectionReference productRef = _db.collection('Products');
      productRef.add({'Name': product.name, 'Size': product.size});
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> fetchProductData() async {
    try {
      CollectionReference productRef = _db.collection('Products');
      final documents = await _db.collection('Products').get();
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
