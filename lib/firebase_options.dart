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
    apiKey: 'AIzaSyAq-X1ssCqasJIwtrpdSnq92kg0L6T7jRc',
    appId: '1:42515664464:web:6f3eac084390c9b5c38b55',
    messagingSenderId: '42515664464',
    projectId: 'doctor-house-23326',
    authDomain: 'doctor-house-23326.firebaseapp.com',
    storageBucket: 'doctor-house-23326.appspot.com',
    measurementId: 'G-P711SSQJ8V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCa5nMCP_Ybag-RKcXFUv392tJpdbGo3uc',
    appId: '1:42515664464:android:e5694b132f1e4908c38b55',
    messagingSenderId: '42515664464',
    projectId: 'doctor-house-23326',
    storageBucket: 'doctor-house-23326.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3WP-mtwFYMDcBG42aMuEayhcOcJzu2mQ',
    appId: '1:42515664464:ios:4bf5870206f0e924c38b55',
    messagingSenderId: '42515664464',
    projectId: 'doctor-house-23326',
    storageBucket: 'doctor-house-23326.appspot.com',
    iosBundleId: 'com.example.drHouse',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3WP-mtwFYMDcBG42aMuEayhcOcJzu2mQ',
    appId: '1:42515664464:ios:e38d21260a06492bc38b55',
    messagingSenderId: '42515664464',
    projectId: 'doctor-house-23326',
    storageBucket: 'doctor-house-23326.appspot.com',
    iosBundleId: 'com.example.drHouse.RunnerTests',
  );
}
