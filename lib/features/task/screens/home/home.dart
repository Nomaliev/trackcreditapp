import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trackcreditapp/features/task/screens/addcredit.dart';
import 'package:trackcreditapp/utilities/constans/colors.dart';
import 'package:trackcreditapp/utilities/constans/helpers/helper_functions.dart';
import 'package:trackcreditapp/utilities/constans/sizes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final fetchedData = FirebaseFirestore.instance
        .collection('Products')
        .orderBy('Date', descending: true);
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
        title: Center(
          child: Text(
            'Satışlar',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: fetchedData.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(AppSizes.defaultPadding),
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final document = snapshot.data!.docs[index];
                  return Card(
                    color: isDark
                        ? AppColors.darkContainer
                        : AppColors.lightContainer,
                    margin: const EdgeInsets.all(AppSizes.inputSize),
                    child: Padding(
                      padding: const EdgeInsets.all(AppSizes.fieldSpace),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Parça : ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                              SizedBox(
                                width: 270,
                                child: Text(document['Name'],
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .apply(
                                          overflow: TextOverflow.ellipsis,
                                        )),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSizes.inputSize / 4),
                          Row(
                            children: [
                              Text('Ölçü : ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                              SizedBox(
                                width: 270,
                                child: Text(document['Size'],
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                              ),
                            ],
                          ),
                          Divider(
                              color: isDark
                                  ? AppColors.darkDivider
                                  : AppColors.lightDivider),
                          Row(
                            children: [
                              Text('Tarix : ',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              Text(document['Date'],
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
