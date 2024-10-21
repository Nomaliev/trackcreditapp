import 'package:flutter/material.dart';
import 'package:trackcreditapp/data/repositories/authentication_repository.dart';
import 'package:trackcreditapp/utilities/constans/sizes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hello'),
            ElevatedButton(
                onPressed: () => AuthenticationRepository.instance.logOut(),
                child: const Text('Sign Out'))
          ],
        ),
      ),
    );
  }
}
