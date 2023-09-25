// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAKSEb85DDMSdKHB7eShNQ_0gcAFvPpe_I',
    appId: '1:536583686551:web:9c296c600cc14f782b9cd2',
    messagingSenderId: '536583686551',
    projectId: 'foodapp-a2876',
    authDomain: 'foodapp-a2876.firebaseapp.com',
    storageBucket: 'foodapp-a2876.appspot.com',
    measurementId: 'G-6ZBNJT2GWG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAaai0rQJrBNaLW9VQk0TAOUPvDyAxs9vw',
    appId: '1:536583686551:android:7532b33cd4650b272b9cd2',
    messagingSenderId: '536583686551',
    projectId: 'foodapp-a2876',
    storageBucket: 'foodapp-a2876.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCFsAzMm5b9MllEz_ubyExVbU5CBmqtTK8',
    appId: '1:536583686551:ios:fdb9ff03f34db9bb2b9cd2',
    messagingSenderId: '536583686551',
    projectId: 'foodapp-a2876',
    storageBucket: 'foodapp-a2876.appspot.com',
    androidClientId: '536583686551-u7v6av3ktlgvlpr2n1dpnr16fsl1vnp1.apps.googleusercontent.com',
    iosClientId: '536583686551-v3935fmpfnmfmslqvpdu0l6nirih03su.apps.googleusercontent.com',
    iosBundleId: 'com.example.abc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCFsAzMm5b9MllEz_ubyExVbU5CBmqtTK8',
    appId: '1:536583686551:ios:509f892584d433202b9cd2',
    messagingSenderId: '536583686551',
    projectId: 'foodapp-a2876',
    storageBucket: 'foodapp-a2876.appspot.com',
    androidClientId: '536583686551-u7v6av3ktlgvlpr2n1dpnr16fsl1vnp1.apps.googleusercontent.com',
    iosClientId: '536583686551-rprqrmmafdimvptlv921eri87ni3a9s5.apps.googleusercontent.com',
    iosBundleId: 'com.example.abc.RunnerTests',
  );
}