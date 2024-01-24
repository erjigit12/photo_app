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
    apiKey: 'AIzaSyDRYfI-aVCadaCKAGODKR9cQ1gQAIqdOns',
    appId: '1:651450892019:web:16ce4d5adef7bf8d010186',
    messagingSenderId: '651450892019',
    projectId: 'photo-app-984ad',
    authDomain: 'photo-app-984ad.firebaseapp.com',
    storageBucket: 'photo-app-984ad.appspot.com',
    measurementId: 'G-QWE6X48FQK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAnd6A27eELjKFj1bCDHwQoBfF_2zJl28w',
    appId: '1:651450892019:android:a11bf468d5a2bb04010186',
    messagingSenderId: '651450892019',
    projectId: 'photo-app-984ad',
    storageBucket: 'photo-app-984ad.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDcra4TkE65z2rK5G6arh9EplfJiH_KaK0',
    appId: '1:651450892019:ios:0f4f3cef4bd18ec4010186',
    messagingSenderId: '651450892019',
    projectId: 'photo-app-984ad',
    storageBucket: 'photo-app-984ad.appspot.com',
    iosBundleId: 'com.example.photosApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDcra4TkE65z2rK5G6arh9EplfJiH_KaK0',
    appId: '1:651450892019:ios:8d85ce83d3bd62da010186',
    messagingSenderId: '651450892019',
    projectId: 'photo-app-984ad',
    storageBucket: 'photo-app-984ad.appspot.com',
    iosBundleId: 'com.example.photosApp.RunnerTests',
  );
}
