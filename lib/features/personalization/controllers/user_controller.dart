import 'package:ecommerce_app/data/repositories/auth/authentication_repository.dart';
import 'package:ecommerce_app/data/repositories/user/user_repository.dart';
import 'package:ecommerce_app/features/authentication/models/user_model.dart';
import 'package:ecommerce_app/features/authentication/screens/login/login.dart';
import 'package:ecommerce_app/features/personalization/screens/profile/widgets/re_auth_form.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/network_manager.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  //save user record
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        final nameParts =
            UserModel.nameParts(userCredential.user!.displayName ?? "");
        final username =
            UserModel.generateUsername(userCredential.user!.displayName ?? "");

        final user = UserModel(
            id: userCredential.user!.uid,
            firstname: nameParts.first,
            lastname:
                nameParts.length > 1 ? nameParts.sublist(1).join(" ") : '',
            username: username,
            email: userCredential.user?.email ?? " ",
            phoneNumber: userCredential.user?.phoneNumber ?? " ",
            profilePicture: userCredential.user?.photoURL ?? " ");

        await userRepository.saveUserData(user);
      }
    } catch (e) {
      TFullScreenLoader.warningSnackBar(
          title: 'Data not saved',
          message: "Something went wrong while saving your info");
    }
  }

  Future<void> fetchUserDetails() async {
    try {
      profileLoading.value = true;
      final data = await userRepository.fetchUserDetails();

      user(data);
    } catch (e) {
      this.user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(TSizes.md),
      title: "Delete account",
      middleText: "Are you sure you want to delete your account?",
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, side: BorderSide(color: Colors.red)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () async => Navigator.of(Get.overlayContext!).pop(),
        child: Text('cancle'),
      ),
    );
  }

  deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingPage('Processing', TImages.dockerAnimation);

      final auth = AuthenticationRepository.instance;
      final provider =
          auth.currentUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TFullScreenLoader.errorSnackBar(title: 'something went wrong');
    }
  }

  Future<void> reAuthEmailAndPassword() async {
    try {
      TFullScreenLoader.openLoadingPage('Processing', TImages.dockerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      print('internet connection is $isConnected');
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.reAuthWithEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TFullScreenLoader.errorSnackBar(title: 'something went wrong');
    }
  }
}
