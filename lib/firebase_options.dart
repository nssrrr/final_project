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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAj2L-waupkjk4nlZxxT263NRIgDWU0uig',
    appId: '1:923346507058:android:733fe19f1fa4e69d6db32b',
    messagingSenderId: '923346507058',
    projectId: 'finalproject-20317',
    storageBucket: 'finalproject-20317.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA4UHViQXzfJ_AFfHhdPbYBjH6arpGiKLc',
    appId: '1:923346507058:ios:e8a024a43772f28d6db32b',
    messagingSenderId: '923346507058',
    projectId: 'finalproject-20317',
    storageBucket: 'finalproject-20317.appspot.com',
    iosBundleId: 'com.project.finalProject',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAknb3gKXRkpgVSp6U7pEThdmTciQI-sos',
    appId: '1:923346507058:web:c70e5410350094006db32b',
    messagingSenderId: '923346507058',
    projectId: 'finalproject-20317',
    authDomain: 'finalproject-20317.firebaseapp.com',
    storageBucket: 'finalproject-20317.appspot.com',
    measurementId: 'G-7EE06YK7FE',
  );

}