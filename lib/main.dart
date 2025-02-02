import 'package:ecommerce_app/app.dart';
import 'package:ecommerce_app/data/repositories/auth/authentication_repository.dart';
import 'package:ecommerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  // widgets bindings
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  // local storage
  await GetStorage.init();
  //init payment methods

  // native splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  //initialize auth

  runApp(const App());
}
