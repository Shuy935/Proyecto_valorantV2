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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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
/*
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDM-V_UXIGExg-7xTsJkDSOjXAVsf2w-Q8',
    appId: '1:23478154947:web:565a850402b3ce766e5476',
    messagingSenderId: '23478154947',
    projectId: 'baselogin-b9f65',
    authDomain: 'baselogin-b9f65.firebaseapp.com',
    storageBucket: 'baselogin-b9f65.appspot.com',
    measurementId: 'G-WNDRS28FE5',
  );
*/
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyACGbqT6fGlRsoHl8MCFentjLoZ5Vx84UY',
    appId: '1:23478154947:android:27d818c4f94103586e5476',
    messagingSenderId: '23478154947',
    projectId: 'baselogin-b9f65',
    storageBucket: 'baselogin-b9f65.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCXMJs5Yl5Rbtu3KiCxAoy2FPP4BEByRvA',
    appId: '1:23478154947:ios:c3667b201bed7db46e5476',
    messagingSenderId: '23478154947',
    projectId: 'baselogin-b9f65',
    storageBucket: 'baselogin-b9f65.appspot.com',
    iosBundleId: 'com.example.loginMoviles2',
  );
/*
  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCXMJs5Yl5Rbtu3KiCxAoy2FPP4BEByRvA',
    appId: '1:23478154947:ios:98014c4dfcc767136e5476',
    messagingSenderId: '23478154947',
    projectId: 'baselogin-b9f65',
    storageBucket: 'baselogin-b9f65.appspot.com',
    iosBundleId: 'com.example.loginMoviles2.RunnerTests',
  );
  */
}
