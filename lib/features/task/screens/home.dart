import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trackcreditapp/data/repositories/authentication_repository.dart';
import 'package:trackcreditapp/features/task/addcredit.dart';
import 'package:trackcreditapp/utilities/constans/colors.dart';
import 'package:trackcreditapp/utilities/constans/helpers/helper_functions.dart';
import 'package:trackcreditapp/utilities/constans/sizes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      floatingActionButton: IconButton(
        onPressed: () => Get.to(() => const Addcredit()),
        icon: Icon(
          Iconsax.add,
          color: isDark ? AppColors.white : AppColors.black,
        ),
        color: AppColors.white,
        iconSize: 35,
      ),
      appBar: AppBar(
        title: Text(
          'Satışlar',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hello'),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => AuthenticationRepository.instance.logOut(),
                  child: const Text('Sign Out')),
            )
          ],
        ),
      ),
    );
  }
}
