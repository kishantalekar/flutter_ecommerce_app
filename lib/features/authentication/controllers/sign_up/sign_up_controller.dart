import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_app/data/repositories/auth/authentication_repository.dart';
import 'package:ecommerce_app/data/repositories/user/user_repository.dart';
import 'package:ecommerce_app/features/authentication/models/user_model.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/helpers/network_manager.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;

  final email = TextEditingController();
  final lastname = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstname = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signFormKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    try {
      TFullScreenLoader.openLoadingPage(
          'We are processing your information', TImages.dockerAnimation);

      //check internet connectivity

      final isConnected = await NetworkManager.instance.isConnected();
      print('internet connection is $isConnected');
      if (!isConnected) {
        return;
      }
      if (!privacyPolicy.value) {
        TFullScreenLoader.warningSnackBar(
            title: 'Accept privaciy policy',
            message: 'In order to create account ');
        return;
      }
      if (!signFormKey.currentState!.validate()) {
        return;
      }

      //register user
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());
      //save authencticated user to firestore

      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstname: firstname.text,
          lastname: lastname.text,
          username: username.text,
          email: email.text,
          phoneNumber: phoneNumber.text,
          profilePicture: '');
      final UserRepository userRepository = Get.put(UserRepository());
      await userRepository.saveUserData(newUser);
      TFullScreenLoader.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! verify email to continue');

      Get.to(() => const VerfiyEmailScreen());
    } catch (e) {
      TFullScreenLoader.errorSnackBar(title: 'oh Snap!', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}
