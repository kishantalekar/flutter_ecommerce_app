import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/image/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Sports'),
        showBackAction: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //banner
              const TRoundedImage(
                  width: double.infinity,
                  applyImageRadius: true,
                  imageUrl: TImages.promoBanner1),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //sub categories
              Column(
                children: [
                  //heading
                  TSectionHeading(
                    title: 'Sports shirt',
                    onPressed: () {},
                  ),

                  const SizedBox(
                    height: TSizes.spaceBtwSections / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        separatorBuilder: (_, __) =>
                            const SizedBox(width: TSizes.spaceBtwItems),
                        shrinkWrap: true,
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) =>
                            const ProductCardHorizontal()),
                  )
                  //
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
