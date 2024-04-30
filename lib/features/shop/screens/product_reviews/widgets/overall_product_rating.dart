import 'package:ecommerce_app/features/shop/screens/product_reviews/widgets/progress_rating_indicator.dart';
import 'package:flutter/material.dart';

class TOverallProductRating extends StatelessWidget {
  const TOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '4.8',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              TProgressRatingIndicator(
                text: "5",
                value: 0.4,
              ),
              TProgressRatingIndicator(
                text: "4",
                value: 0.5,
              ),
              TProgressRatingIndicator(
                text: "3",
                value: 0.8,
              ),
              TProgressRatingIndicator(
                text: "2",
                value: 0.1,
              ),
              TProgressRatingIndicator(
                text: "1",
                value: 1,
              ),
            ],
          ),
        )
      ],
    );
  }
}
