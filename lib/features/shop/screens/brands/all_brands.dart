import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/brands/brand_card.dart';
import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce_app/features/shop/screens/brands/brands_products.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text("Brand"),
        showBackAction: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(children: [
            //heading
            const TSectionHeading(title: "Brands"),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            //brands
            TGridLayout(
                mainAxisExtent: 80,
                itemCount: 10,
                itemBuilder: (_, index) => TBrandCard(
                      showBorder: true,
                      onTap: () {
                        Get.to(() => BrandsProduct());
                      },
                    ))
          ]),
        ),
      ),
    );
  }
}