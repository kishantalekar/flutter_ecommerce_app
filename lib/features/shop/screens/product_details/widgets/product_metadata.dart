import 'package:ecommerce_app/common/widgets/image/circular_image.dart';
import 'package:ecommerce_app/common/widgets/texts/brand_title_text_with_verification.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/container/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //price and sale price
        Row(
          children: [
            RoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                "25%",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            //price
            Text(
              '\$350',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            const TProductPriceText(
              price: '175',
              lineThrough: false,
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems / 1.5),
        //title
        const ProductTitleText(title: 'Green nike Sports Shirt'),
        const SizedBox(width: TSizes.spaceBtwItems / 1.5),

        //stock status
        Row(
          children: [
            const ProductTitleText(title: 'Status'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              'In stock',
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),

        const SizedBox(width: TSizes.spaceBtwItems / 1.5),
        //brans
        Row(
          children: [
            TCircularImage(
              image: TImages.shoeIcon,
              overlayColor: dark ? TColors.dark : TColors.black,
            ),
            TBrandTitleTextWithVerification(
              title: 'Nike',
              brandTextSizes: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
