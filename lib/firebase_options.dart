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
    apiKey: 'AIzaSyAZ2DQWp38ZOjRLAgO6Eq-eF3eZr47Xpqs',
    appId: '1:1062829905699:web:31a14cf22790ca25bb5e96',
    messagingSenderId: '1062829905699',
    projectId: 'diet-planner-ai',
    authDomain: 'diet-planner-ai.firebaseapp.com',
    storageBucket: 'diet-planner-ai.appspot.com',
    measurementId: 'G-EGD16WQ69C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBakochd8PGHC2xbrgVj4i6ibiTTfBZU6E',
    appId: '1:1062829905699:android:2b264fbca9542923bb5e96',
    messagingSenderId: '1062829905699',
    projectId: 'diet-planner-ai',
    storageBucket: 'diet-planner-ai.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCQjpuDM0L0pS-0A-TtCXImWsiMBIiBtyg',
    appId: '1:1062829905699:ios:a865a95f41c6a918bb5e96',
    messagingSenderId: '1062829905699',
    projectId: 'diet-planner-ai',
    storageBucket: 'diet-planner-ai.appspot.com',
    iosClientId: '1062829905699-62j4lio3fejod1njj1rdptu8crphr5fj.apps.googleusercontent.com',
    iosBundleId: 'com.example.dietPlanner',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCQjpuDM0L0pS-0A-TtCXImWsiMBIiBtyg',
    appId: '1:1062829905699:ios:a865a95f41c6a918bb5e96',
    messagingSenderId: '1062829905699',
    projectId: 'diet-planner-ai',
    storageBucket: 'diet-planner-ai.appspot.com',
    iosClientId: '1062829905699-62j4lio3fejod1njj1rdptu8crphr5fj.apps.googleusercontent.com',
    iosBundleId: 'com.example.dietPlanner',
  );
}
