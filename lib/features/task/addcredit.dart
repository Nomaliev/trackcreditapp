import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackcreditapp/features/task/controllers/add_credit_controller.dart';
import 'package:trackcreditapp/features/task/screens/home.dart';
import 'package:trackcreditapp/utilities/constans/sizes.dart';
import 'package:trackcreditapp/utilities/constans/strings.dart';
import 'package:trackcreditapp/utilities/constans/validation.dart';
import 'package:trackcreditapp/utilities/constans/widgets/appbar.dart';

class Addcredit extends StatelessWidget {
  const Addcredit({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddCreditController());
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        leadingOnPressed: () => Get.offAll(() => const HomePage()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultPadding),
        child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) =>
                      AppValidator.validateEmptyField('Parça', value),
                  controller: controller.productInput,
                  decoration: const InputDecoration(labelText: 'Parça'),
                ),
                const SizedBox(height: AppSizes.fieldSpace),
                TextFormField(
                  validator: (value) =>
                      AppValidator.validateEmptyField('Uzunluq', value),
                  controller: controller.productSizeInput,
                  decoration: const InputDecoration(labelText: 'Uzunluq'),
                ),
                const SizedBox(height: AppSizes.sectionSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.saveProductData(),
                      child: const Text(AppStrings.rememberMe)),
                )
              ],
            )),
      ),
    );
  }
}
