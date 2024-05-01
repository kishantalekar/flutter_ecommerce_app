import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/brands/brand_card.dart';
import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandsProduct extends StatelessWidget {
  const BrandsProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text("Nike"),
        showBackAction: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(children: [
            //heading
            TBrandCard(showBorder: true),
            const SizedBox(
              height: TSizes.spaceBtwItems * 2,
            ),

            TSortableProducts(),
            //brands
            // TGridLayout(
            //     mainAxisExtent: 80,
            //     itemCount: 10,
            //     itemBuilder: (_, index) => TBrandCard(
            //           showBorder: true,
            //           onTap: () {
            //             Get.to(() => AllProducts());
            //           },
            //         ))
          ]),
        ),
      ),
    );
  }
}
