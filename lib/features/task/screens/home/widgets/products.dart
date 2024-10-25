import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackcreditapp/features/task/controllers/product_controller.dart';
import 'package:trackcreditapp/utilities/constans/colors.dart';
import 'package:trackcreditapp/utilities/constans/helpers/helper_functions.dart';
import 'package:trackcreditapp/utilities/constans/sizes.dart';
import 'package:trackcreditapp/utilities/constans/strings.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context);
    final controller = Get.put(ProductController());
    return StreamBuilder(
      stream: controller.fetchedData.snapshots(),
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
                            Text('${AppStrings.textile} : ',
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                            SizedBox(
                              width: 270,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 220,
                                    child: Text(document['Name'],
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .apply(
                                              overflow: TextOverflow.ellipsis,
                                            )),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        controller.removeProduct(index);
                                      },
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red))
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSizes.inputSize / 4),
                        Row(
                          children: [
                            Text('${AppStrings.size} : ',
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
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
                            Text('${AppStrings.date} : ',
                                style: Theme.of(context).textTheme.titleMedium),
                            Text(document['Date'],
                                style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
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
    );
  }
}
