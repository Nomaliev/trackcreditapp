import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trackcreditapp/features/authentication/controllers/signup_controller.dart';
import 'package:trackcreditapp/features/authentication/screens/loginpage/login_page.dart';
import 'package:trackcreditapp/utilities/constans/sizes.dart';
import 'package:trackcreditapp/utilities/constans/strings.dart';
import 'package:trackcreditapp/utilities/constans/validation.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => AppValidator.validateEmail(value),
              decoration: const InputDecoration(
                  label: Text(AppStrings.email),
                  prefixIcon: Icon(Iconsax.user)),
            ),
            const SizedBox(height: AppSizes.fieldSpace),
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => AppValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    label: const Text(AppStrings.password),
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye))),
              ),
            ),
            const SizedBox(height: AppSizes.fieldSpace),
            Obx(
              () => TextFormField(
                controller: controller.confirmPassword,
                validator: (value) =>
                    AppValidator.validatePasswordConfirm(value),
                obscureText: controller.hideConfirmPassword.value,
                decoration: InputDecoration(
                    label: const Text(AppStrings.confirmPassword),
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: () => controller.hideConfirmPassword.value =
                            !controller.hideConfirmPassword.value,
                        icon: Icon(controller.hideConfirmPassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye))),
              ),
            ),
            const SizedBox(width: AppSizes.inputSize / 2),
            const SizedBox(height: AppSizes.sectionSpace),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signUp(),
                  child: const Text(AppStrings.signUp)),
            ),
            const SizedBox(height: AppSizes.fieldSpace),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(AppStrings.alreadyHaveAccount),
                const SizedBox(width: AppSizes.fieldSpace),
                GestureDetector(
                  onTap: () => Get.offAll(() => const LoginPage()),
                  child: Text(
                    AppStrings.login,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .apply(color: Colors.red),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
