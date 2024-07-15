import 'package:ecommerce_app/data/repositories/user/user_repository.dart';
import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_app/features/personalization/screens/profile/profile.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/helpers/network_manager.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeNameController extends GetxController {
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final userController = UserController.instance;
  final userReposity = Get.put(UserRepository());
  final GlobalKey<FormState> changeNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    initializeName();
  }

  Future<void> updateUsername() async {
    try {
      TFullScreenLoader.openLoadingPage(
          'We are updating info...', TImages.dockerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      print('internet connection is $isConnected');
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!changeNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      Map<String, dynamic> name = {
        'FirstName': firstname.text.trim(),
        'LastName': lastname.text.trim()
      };
      await userReposity.updateSingleField(name);
      userController.user.value.firstname = firstname.text.trim();
      userController.user.value.lastname = lastname.text.trim();
      TFullScreenLoader.stopLoading();
      TFullScreenLoader.successSnackBar(
          title: 'Congratulations', message: "details updated successfully");
      Get.off(() => ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
    }
  }

  void initializeName() {
    firstname.text = userController.user.value.firstname;
    lastname.text = userController.user.value.lastname;
  }
}
