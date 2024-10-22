import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  ProductModel({required this.name, required this.size});
  final String name;
  final String size;

  Map<String, dynamic> toJson() {
    return {'Name': name, 'Size': size};
  }

  static ProductModel empty() => ProductModel(name: '', size: '');

  factory ProductModel.fromJson(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return ProductModel(name: data['Name'] ?? '', size: data['Size'] ?? '');
    } else {
      return ProductModel.empty();
    }
  }
}
