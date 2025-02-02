// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAZaWBhCL7_6K7fhWB8Zv4GIz-SHzyam_s',
    appId: '1:346109307463:web:ff39f048c3c53b26fc5f62',
    messagingSenderId: '346109307463',
    projectId: 'ecommerce-app-8f838',
    authDomain: 'ecommerce-app-8f838.firebaseapp.com',
    storageBucket: 'ecommerce-app-8f838.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDlB6sYyex4Xz4dUsqlepsfTFrPFMOYlRw',
    appId: '1:346109307463:android:4ffde9054c9fbe90fc5f62',
    messagingSenderId: '346109307463',
    projectId: 'ecommerce-app-8f838',
    storageBucket: 'ecommerce-app-8f838.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCE68klm8vM7prnbo8hErQgmFXncsCGl_8',
    appId: '1:346109307463:ios:9855d4040ac747a0fc5f62',
    messagingSenderId: '346109307463',
    projectId: 'ecommerce-app-8f838',
    storageBucket: 'ecommerce-app-8f838.appspot.com',
    androidClientId: '346109307463-qm8ao678he8gk2i5ch1g5divgapkiaep.apps.googleusercontent.com',
    iosClientId: '346109307463-bs13ogijc7vj963rq6kdipss3m8qnvho.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCE68klm8vM7prnbo8hErQgmFXncsCGl_8',
    appId: '1:346109307463:ios:9855d4040ac747a0fc5f62',
    messagingSenderId: '346109307463',
    projectId: 'ecommerce-app-8f838',
    storageBucket: 'ecommerce-app-8f838.appspot.com',
    androidClientId: '346109307463-qm8ao678he8gk2i5ch1g5divgapkiaep.apps.googleusercontent.com',
    iosClientId: '346109307463-bs13ogijc7vj963rq6kdipss3m8qnvho.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerceApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAZaWBhCL7_6K7fhWB8Zv4GIz-SHzyam_s',
    appId: '1:346109307463:web:22abab7f6d1d4f9afc5f62',
    messagingSenderId: '346109307463',
    projectId: 'ecommerce-app-8f838',
    authDomain: 'ecommerce-app-8f838.firebaseapp.com',
    storageBucket: 'ecommerce-app-8f838.appspot.com',
  );

}