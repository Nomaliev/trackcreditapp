import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trackcreditapp/features/authentication/screens/signup/signup.dart';
import 'package:trackcreditapp/utilities/constans/sizes.dart';
import 'package:trackcreditapp/utilities/constans/strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

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
          decoration: const InputDecoration(
              label: Text(AppStrings.password),
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash)),
        ),
        Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (value) {},
            ),
            Text(AppStrings.rememberMe,
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(width: AppSizes.sectionSpace * 2),
            Text(AppStrings.forgotPassword,
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        const SizedBox(height: AppSizes.sectionSpace),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {}, child: const Text(AppStrings.login)),
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
