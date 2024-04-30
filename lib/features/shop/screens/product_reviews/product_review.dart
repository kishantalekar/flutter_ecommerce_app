import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/features/shop/screens/product_reviews/widgets/overall_product_rating.dart';
import 'package:ecommerce_app/features/shop/screens/product_reviews/widgets/rating_bar_indicator.dart';
import 'package:ecommerce_app/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text("Review & Ratings"),
        showBackAction: true,
      ),
      //body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Rating and reviews are verified and are from people who use the same type of device that you use.",
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              //overall rating
              const TOverallProductRating(),
              const TRatingBarIndicator(
                rating: 4.5,
              ),
              Text(
                '12,6111',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              //user reviw list

              const UserReviewCard()
            ],
          ),
        ),
      ),
    );
  }
}
