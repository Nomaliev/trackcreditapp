import 'package:flutter/material.dart';
import 'package:trackcreditapp/features/authentication/screens/loginpage/widgets/login_form.dart';
import 'package:trackcreditapp/utilities/constans/sizes.dart';
import 'package:trackcreditapp/utilities/constans/strings.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                Text(AppStrings.login,
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: AppSizes.sectionSpace),
                const LoginForm()
              ],
            ),
          ),
        ));
  }
}
