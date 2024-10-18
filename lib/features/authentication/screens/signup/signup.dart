import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trackcreditapp/utilities/constans/sizes.dart';
import 'package:trackcreditapp/utilities/constans/strings.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.signUp,
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: AppSizes.sectionSpace),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text(AppStrings.email),
                          prefixIcon: Icon(Iconsax.user)),
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
                          onPressed: () {},
                          child: const Text(AppStrings.signUp)),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}
