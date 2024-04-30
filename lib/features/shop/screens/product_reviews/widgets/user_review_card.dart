import 'package:ecommerce_app/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce_app/features/shop/screens/product_reviews/widgets/rating_bar_indicator.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(TImages.userProfileImage1),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  'John doe',
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        //Review
        Row(
          children: [
            const TRatingBarIndicator(rating: 4.3),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '01 nov ,2023',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),

        //readmore
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        const ReadMoreText(
          'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
          trimMode: TrimMode.Line,
          trimLines: 3,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
        ),

        //company review

        RoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.light,
          padding: const EdgeInsets.all(TSizes.md),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "T's store",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "02 nov 2023",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const ReadMoreText(
                'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                trimMode: TrimMode.Line,
                trimLines: 2,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: TColors.primary),
                lessStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: TColors.primary),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
      ],
    );
  }
}
