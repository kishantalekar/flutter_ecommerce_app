import 'package:ecommerce_app/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/container/search_container.dart';
import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //appbar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  //searchbar
                  TSearchContainer(
                    text: "Search in store",
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),

                  //categories
                  THomeCategories(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  )
                ],
              ),
            ),
            //body

            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  /// -> heading
                  TSectionHeading(
                    title: "Popular products",
                    showAction: true,
                    onPressed: () {
                      Get.to(() => const AllProducts());
                    },
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  TGridLayout(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return const ProductCardVertical();
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
