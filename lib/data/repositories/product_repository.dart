import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trackcreditapp/features/task/models/product_model.dart';
import 'package:trackcreditapp/utilities/constans/exceptions/firebase_exceptions.dart';
import 'package:trackcreditapp/utilities/constans/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveProductData(ProductModel product) async {
    try {
      final currentTime = DateTime.now();
      CollectionReference productRef = _db.collection('Products');
      productRef.add({
        'Name': product.name,
        'Size': product.size,
        'Date': DateFormat('d-MM-yyyy').format(currentTime)
      });
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

  // Future<ProductModel> fetchProductData() async {
  //   try {
  //     CollectionReference productRef = _db.collection('Products');
  //     final snapshots = await productRef.doc().get();
  //     if (snapshots.exists) {
  //       return ProductModel.fromJson(
  //           snapshots as DocumentSnapshot<Map<String, dynamic>>);
  //     } else {
  //       return ProductModel.empty();
  //     }
  //   } on FirebaseException catch (e) {
  //     throw AppFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const FormatException();
  //   } on PlatformException catch (e) {
  //     throw AppPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong. Please try again';
  //   }
  // }

  Future<void> removeProduct(int index) async {
    try {
      QuerySnapshot snapshots = await FirebaseFirestore.instance
          .collection('Products')
          .orderBy('Date', descending: true)
          .get();
      final documents = snapshots.docs[index];
      final documentId = documents.id;
      await FirebaseFirestore.instance
          .collection('Products')
          .doc(documentId)
          .delete();
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
