import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trackcreditapp/features/authentication/screens/loginpage/login_page.dart';
import 'package:trackcreditapp/utilities/constans/sizes.dart';
import 'package:trackcreditapp/utilities/constans/strings.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
              label: Text(AppStrings.email), prefixIcon: Icon(Iconsax.user)),
        ),
        const SizedBox(
          height: AppSizes.fieldSpace,
        ),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
              label: Text(AppStrings.password),
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash)),
        ),
        const SizedBox(height: AppSizes.fieldSpace),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
              label: Text(AppStrings.confirmPassword),
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash)),
        ),
        const SizedBox(width: AppSizes.inputSize / 2),
        const SizedBox(height: AppSizes.sectionSpace),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {}, child: const Text(AppStrings.signUp)),
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
