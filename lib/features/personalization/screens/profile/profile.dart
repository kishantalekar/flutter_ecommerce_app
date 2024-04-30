import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/image/circular_image.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text("Profile"),
        showBackAction: true,
      ),

      //body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(
                      image: TImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Change profile picture'))
                  ],
                ),
              ),

              ///details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeading(
                  title: 'Profile information', showAction: false),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                title: "Name",
                value: "Coding with kishan",
                onPressed: () {},
              ),
              TProfileMenu(
                title: "Username",
                value: "kishan",
                onPressed: () {},
              ),

              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              const TSectionHeading(
                  title: 'Personal information', showAction: false),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                title: "User id",
                value: "4253",
                onPressed: () {},
                icon: Iconsax.copy,
              ),
              TProfileMenu(
                title: "Email",
                value: "conding with t",
                onPressed: () {},
              ),
              TProfileMenu(
                title: "Phone number",
                value: "950523523",
                onPressed: () {},
              ),
              TProfileMenu(
                title: "Gender ",
                value: "Male",
                onPressed: () {},
              ),
              TProfileMenu(
                title: "Date of birth",
                value: "7-5-2003",
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Center(
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "close account",
                      style: TextStyle(color: Colors.red),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
