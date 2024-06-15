import 'package:ecommerce_app/data/repositories/user/user_repository.dart';
import 'package:ecommerce_app/features/authentication/models/user_model.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
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
}
