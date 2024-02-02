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
    apiKey: 'AIzaSyB8reTDlB1JLMhRAOmt8F3ZL6oqrV_TKa0',
    appId: '1:905108314809:web:e5877210de91ec411d1968',
    messagingSenderId: '905108314809',
    projectId: 'pestprediction',
    authDomain: 'pestprediction.firebaseapp.com',
    storageBucket: 'pestprediction.appspot.com',
    measurementId: 'G-XC4ZKT1K1Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD7qgoULOM764tP9qUv3X2H6WA9-3_rGKM',
    appId: '1:905108314809:android:e8d7d8cfb529a0501d1968',
    messagingSenderId: '905108314809',
    projectId: 'pestprediction',
    storageBucket: 'pestprediction.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAjOi8JPcntMtn54-6KCRKoa_cmlPljlSk',
    appId: '1:905108314809:ios:967255f96781fe001d1968',
    messagingSenderId: '905108314809',
    projectId: 'pestprediction',
    storageBucket: 'pestprediction.appspot.com',
    iosBundleId: 'com.example.mainprojectCrop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAjOi8JPcntMtn54-6KCRKoa_cmlPljlSk',
    appId: '1:905108314809:ios:3d6430c71295433f1d1968',
    messagingSenderId: '905108314809',
    projectId: 'pestprediction',
    storageBucket: 'pestprediction.appspot.com',
    iosBundleId: 'com.example.mainprojectCrop.RunnerTests',
  );
}
