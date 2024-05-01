import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/products/cart/cart_items.dart';
import 'package:ecommerce_app/common/widgets/products/cart/coupon_code.dart';
import 'package:ecommerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:ecommerce_app/features/personalization/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecommerce_app/features/personalization/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecommerce_app/features/personalization/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "Order Review",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackAction: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //items in cart
              const TCartItems(
                showAddRemoveButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //coupons
              const TCouponCode(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //billing container

              RoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.light,
                child: const Column(children: [
                  //price
                  BillingAmountSection(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Divider(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  //payment methods
                  BillingPaymentSection(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  BillingAddressSection()
                  //Address
                ]),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => SuccessScreen(
                  image: TImages.successfulPaymentIcon,
                  title: 'Payment successful',
                  subtitle: 'Yours item will be shipped soon',
                  onPressed: () {
                    Get.offAll(() => const NavigationMenu());
                  },
                ));
          },
          child: const Text("Checkout  \$256"),
        ),
      ),
    );
  }
}
