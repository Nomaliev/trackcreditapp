import 'package:flutter/material.dart';
import 'package:trackcreditapp/utilities/constans/sizes.dart';

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
                Text('Giriş Et',
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: AppSizes.sectionSpace),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(label: Text('Email')),
                    ),
                    const SizedBox(
                      height: AppSizes.fieldSpace,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(label: Text('Şifrə')),
                    )
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}
