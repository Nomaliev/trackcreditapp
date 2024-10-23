import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trackcreditapp/features/task/addcredit.dart';
import 'package:trackcreditapp/utilities/constans/colors.dart';
import 'package:trackcreditapp/utilities/constans/helpers/helper_functions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final fetchedData = FirebaseFirestore.instance.collection('Products');
    final isDark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.offAll(() => const Addcredit()),
        child: Icon(
          Iconsax.add,
          color: isDark ? AppColors.white : AppColors.black,
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Satışlar',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: StreamBuilder(
        stream: fetchedData.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final document = snapshot.data!.docs[index];
                return ListTile(
                  title: Text(document['Name']),
                  subtitle: Text(document['Size']),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
