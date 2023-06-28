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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyD4Op39hWFa6QiAatpwzXhIlohoJyhsuu8',
    appId: '1:380662631096:web:48708862c8099c040cc24d',
    messagingSenderId: '380662631096',
    projectId: 'eazyshop-e7de7',
    authDomain: 'eazyshop-e7de7.firebaseapp.com',
    storageBucket: 'eazyshop-e7de7.appspot.com',
    measurementId: 'G-GELCM2TL18',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCp3XJQwpiA47EAknZy2WjYe8SpJs6Mgpk',
    appId: '1:380662631096:android:a26c609589b7c3980cc24d',
    messagingSenderId: '380662631096',
    projectId: 'eazyshop-e7de7',
    storageBucket: 'eazyshop-e7de7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNr5silzntmoThwgvmcaGDSTX4sckZ528',
    appId: '1:380662631096:ios:b444833158baafb60cc24d',
    messagingSenderId: '380662631096',
    projectId: 'eazyshop-e7de7',
    storageBucket: 'eazyshop-e7de7.appspot.com',
    iosBundleId: 'com.example.eazyshop',
  );
}