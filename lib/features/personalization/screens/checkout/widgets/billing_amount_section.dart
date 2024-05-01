import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //subtotal

        Row(
          children: [
            Expanded(
              child: Text(
                'Subtotal',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Text(
              '\$245.0',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                'Shipping',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Text(
              '\$6.0',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                'Tax fee',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Text(
              '\$6.0',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                'Order total',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Text(
              '\$6.0',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ],
    );
  }
}
