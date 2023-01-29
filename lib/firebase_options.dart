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
    apiKey: 'AIzaSyCw_JuT5DpWvykzBW0zYofxNMbn0KfJyHU',
    appId: '1:887430733553:web:16ed32e56e5aca22829350',
    messagingSenderId: '887430733553',
    projectId: 'cas-charity-781fe',
    authDomain: 'cas-charity-781fe.firebaseapp.com',
    storageBucket: 'cas-charity-781fe.appspot.com',
    measurementId: 'G-QS5JVMT3SE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAua71_LbeTqxjLM5SA_C5otJMJT_uCk4o',
    appId: '1:887430733553:android:be09a20226def16a829350',
    messagingSenderId: '887430733553',
    projectId: 'cas-charity-781fe',
    storageBucket: 'cas-charity-781fe.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1WR9dA5M5p5KppJJvKbdtwS2yQDUjLnc',
    appId: '1:887430733553:ios:8c155186b36d9c99829350',
    messagingSenderId: '887430733553',
    projectId: 'cas-charity-781fe',
    storageBucket: 'cas-charity-781fe.appspot.com',
    iosClientId:
        '887430733553-fbnig6h15i6aq81onbcmkikrql94fjmr.apps.googleusercontent.com',
    iosBundleId: 'com.example.casChromebook',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB1WR9dA5M5p5KppJJvKbdtwS2yQDUjLnc',
    appId: '1:887430733553:ios:8c155186b36d9c99829350',
    messagingSenderId: '887430733553',
    projectId: 'cas-charity-781fe',
    storageBucket: 'cas-charity-781fe.appspot.com',
    iosClientId:
        '887430733553-fbnig6h15i6aq81onbcmkikrql94fjmr.apps.googleusercontent.com',
    iosBundleId: 'com.example.casChromebook',
  );
}