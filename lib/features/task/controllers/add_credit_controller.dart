import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCreditController extends GetxController {
  static AddCreditController get instance => Get.find();

  final productInput = TextEditingController();
  final productSizeInput = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
