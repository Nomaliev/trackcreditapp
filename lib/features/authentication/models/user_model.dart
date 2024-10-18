class UserModel {
  UserModel({required this.id, required this.email});
  final String id;
  final String email;

  Map<String, dynamic> toJson() {
    return {"Email": email};
  }
}
