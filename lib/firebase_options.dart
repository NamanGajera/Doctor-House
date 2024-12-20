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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCfzGUyX8t4uwqGH8QMhBe1S37yBWF8ysQ',
    appId: '1:35589346759:web:0f6fdbeb0600156ff335e2',
    messagingSenderId: '35589346759',
    projectId: 'doctor-house-abf3c',
    authDomain: 'doctor-house-abf3c.firebaseapp.com',
    storageBucket: 'doctor-house-abf3c.firebasestorage.app',
    measurementId: 'G-8MVZZ5KHMZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDl8K-YgSOo4A-y8hjnslLLqDSPcjmqqfY',
    appId: '1:35589346759:android:2eed23077221cdf1f335e2',
    messagingSenderId: '35589346759',
    projectId: 'doctor-house-abf3c',
    storageBucket: 'doctor-house-abf3c.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCfzGUyX8t4uwqGH8QMhBe1S37yBWF8ysQ',
    appId: '1:35589346759:web:23d56e2559db866ff335e2',
    messagingSenderId: '35589346759',
    projectId: 'doctor-house-abf3c',
    authDomain: 'doctor-house-abf3c.firebaseapp.com',
    storageBucket: 'doctor-house-abf3c.firebasestorage.app',
    measurementId: 'G-VNT1H5QH08',
  );
}
