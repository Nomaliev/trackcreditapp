import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trackcreditapp/data/repositories/authentication_repository.dart';
import 'package:trackcreditapp/features/task/screens/addcredit.dart';
import 'package:trackcreditapp/features/task/screens/home/widgets/products.dart';
import 'package:trackcreditapp/utilities/constans/colors.dart';
import 'package:trackcreditapp/utilities/constans/helpers/helper_functions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.offAll(() => const AddCredit()),
        child: Icon(
          Iconsax.add,
          color: isDark ? AppColors.white : AppColors.black,
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => AuthenticationRepository.instance.logOut(),
            icon: const Icon(Iconsax.setting)),
        title: Text(
          'Satışlar',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: const Products(),
    );
  }
}
