class ProductModel {
  ProductModel({required this.name, required this.size});
  final String name;
  final String size;

  Map<String, dynamic> toJson() {
    return {'Name': name, 'Size': size};
  }
}
