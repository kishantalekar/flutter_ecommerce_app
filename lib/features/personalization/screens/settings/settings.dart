import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:ecommerce_app/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:ecommerce_app/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/personalization/screens/address/address.dart';
import 'package:ecommerce_app/features/personalization/screens/profile/profile.dart';
import 'package:ecommerce_app/features/shop/screens/order/order.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  //user profile card
                  TUserProfileTile(
                    onPressed: () => Get.to(() => const ProfileScreen()),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeading(
                    title: 'Account settings',
                    showAction: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TSettingMenuTile(
                    title: "My address",
                    subtitle: "Set shopping delivery",
                    icon: Iconsax.safe_home,
                    onTap: () {
                      Get.to(const UserAddressScreen());
                    },
                  ),
                  TSettingMenuTile(
                    title: "My Cart",
                    subtitle: "Add, remove products and move to checkout",
                    icon: Iconsax.shopping_cart,
                    onTap: () {},
                  ),
                  TSettingMenuTile(
                    title: "My orders",
                    subtitle: "In-progress and completed orders",
                    icon: Iconsax.bag_tick,
                    onTap: () {
                      Get.to(() => const OrderScreen());
                    },
                  ),
                  TSettingMenuTile(
                    title: "Bank Account ",
                    subtitle: "withdraw balance to registered account",
                    icon: Iconsax.bank,
                    onTap: () {},
                  ),
                  TSettingMenuTile(
                    title: "My coupons",
                    subtitle: "List of all the discounted coupons",
                    icon: Iconsax.discount_shape,
                    onTap: () {},
                  ),
                  TSettingMenuTile(
                    title: "Notification",
                    subtitle: "set any kind of notification message",
                    icon: Iconsax.notification,
                    onTap: () {},
                  ),
                  TSettingMenuTile(
                    title: "Account privacy",
                    subtitle: "Manage data usage and connected accounts",
                    icon: Iconsax.security_card,
                    onTap: () {},
                  ),

                  //app settings
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSectionHeading(
                    title: "App settings ",
                    showAction: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const TSettingMenuTile(
                    title: 'Load data',
                    subtitle: 'Upload data to your cloud firebase',
                    icon: Iconsax.document_upload,
                  ),
                  TSettingMenuTile(
                    title: 'Geolocation',
                    subtitle: 'Set recommendation based on location',
                    icon: Iconsax.location,
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  TSettingMenuTile(
                    title: 'safe mode',
                    subtitle: 'Search result in safe mode',
                    icon: Iconsax.security_user,
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  TSettingMenuTile(
                    title: 'HD image quality',
                    subtitle: 'Set image quality to be seen ',
                    icon: Iconsax.image,
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),

                  //logout button

                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {}, child: const Text("logout")),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections * 2.5,
                  ),
                ],
              ),
            )
            //body
          ],
        ),
      ),
    );
  }
}
