import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trackcreditapp/features/authentication/controllers/login_controller.dart';
import 'package:trackcreditapp/features/authentication/screens/signup/signup.dart';
import 'package:trackcreditapp/utilities/constans/sizes.dart';
import 'package:trackcreditapp/utilities/constans/strings.dart';
import 'package:trackcreditapp/utilities/constans/validation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
        key: controller.loginFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => AppValidator.validateEmail(value),
              decoration: const InputDecoration(
                  label: Text(AppStrings.email),
                  prefixIcon: Icon(Iconsax.user)),
            ),
            const SizedBox(
              height: AppSizes.fieldSpace,
            ),
            Obx(
              () => TextFormField(
                obscureText: controller.hidePassword.value,
                controller: controller.password,
                validator: (value) =>
                    AppValidator.validateEmptyField('Şifrə', value),
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
            Row(
              children: [
                Obx(
                  () => Checkbox(
                      value: controller.rememberMe.value,
                      onChanged: (value) => controller.rememberMe.value =
                          !controller.rememberMe.value),
                ),
                GestureDetector(
                  onTap: () => controller.rememberMe.value =
                      !controller.rememberMe.value,
                  child: Text(AppStrings.rememberMe,
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
                const SizedBox(width: AppSizes.sectionSpace * 2),
                Text(AppStrings.forgotPassword,
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            const SizedBox(height: AppSizes.sectionSpace),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.login(),
                  child: const Text(AppStrings.login)),
            ),
            const SizedBox(height: AppSizes.fieldSpace),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(AppStrings.noAccount),
                const SizedBox(width: AppSizes.fieldSpace),
                GestureDetector(
                  onTap: () => Get.offAll(() => const SignUpPage()),
                  child: Text(AppStrings.createAccount,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: Colors.red)),
                )
              ],
            )
          ],
        ));
  }
}
