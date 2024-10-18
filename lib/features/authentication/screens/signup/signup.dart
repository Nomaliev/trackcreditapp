import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trackcreditapp/features/authentication/screens/loginpage/login_page.dart';
import 'package:trackcreditapp/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:trackcreditapp/utilities/constans/colors.dart';
import 'package:trackcreditapp/utilities/constans/helper_functions.dart';
import 'package:trackcreditapp/utilities/constans/sizes.dart';
import 'package:trackcreditapp/utilities/constans/strings.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.offAll(() => const LoginPage()),
              icon: Icon(Iconsax.arrow_left_2,
                  color: isDark ? AppColors.white : AppColors.black)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.signUp,
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: AppSizes.sectionSpace),
                const SignupForm()
              ],
            ),
          ),
        ));
  }
}
