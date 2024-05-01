import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackAction: true,
        title: Text("Add new address"),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Iconsax.user,
                        ),
                        labelText: "User"),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Iconsax.mobile,
                        ),
                        labelText: "Phone number"),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Iconsax.building_31,
                              ),
                              labelText: "street"),
                        ),
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtwInputFields,
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Iconsax.code,
                              ),
                              labelText: "Postal code"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Iconsax.building,
                              ),
                              labelText: "city"),
                        ),
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtwInputFields,
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Iconsax.activity,
                              ),
                              labelText: "State"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Iconsax.global,
                        ),
                        labelText: "Country"),
                  ),
                  const SizedBox(
                    height: TSizes.defaultSpace,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('save'),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
