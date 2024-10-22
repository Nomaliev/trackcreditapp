import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trackcreditapp/utilities/constans/colors.dart';
import 'package:trackcreditapp/utilities/constans/helpers/helper_functions.dart';
import 'package:trackcreditapp/utilities/constans/sizes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.inputSize),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: leadingOnPressed,
                icon: Icon(
                  Iconsax.arrow_left_2,
                  color: dark ? AppColors.white : AppColors.black,
                ))
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                : null,
        actions: actions,
        title: title,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
