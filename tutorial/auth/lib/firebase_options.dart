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
    apiKey: 'AIzaSyAiEFjEVyQGNkCJTX0NIkblofEtRyYPpJU',
    appId: '1:764158601819:web:8bb1fb2156e1f7b5136d7e',
    messagingSenderId: '764158601819',
    projectId: 'auth-35c60',
    authDomain: 'auth-35c60.firebaseapp.com',
    storageBucket: 'auth-35c60.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHy5PSteT7RBSGVOvHlDw6dxbUwr8WXoc',
    appId: '1:764158601819:android:5a3be0f519e021af136d7e',
    messagingSenderId: '764158601819',
    projectId: 'auth-35c60',
    storageBucket: 'auth-35c60.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCEp1U8nspt3ENG_75SrOTpVflTcEynr6I',
    appId: '1:764158601819:ios:8c8dcc30765572dd136d7e',
    messagingSenderId: '764158601819',
    projectId: 'auth-35c60',
    storageBucket: 'auth-35c60.appspot.com',
    iosBundleId: 'com.example.auth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCEp1U8nspt3ENG_75SrOTpVflTcEynr6I',
    appId: '1:764158601819:ios:8c8dcc30765572dd136d7e',
    messagingSenderId: '764158601819',
    projectId: 'auth-35c60',
    storageBucket: 'auth-35c60.appspot.com',
    iosBundleId: 'com.example.auth',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAiEFjEVyQGNkCJTX0NIkblofEtRyYPpJU',
    appId: '1:764158601819:web:763320a2a90520af136d7e',
    messagingSenderId: '764158601819',
    projectId: 'auth-35c60',
    authDomain: 'auth-35c60.firebaseapp.com',
    storageBucket: 'auth-35c60.appspot.com',
  );
}
