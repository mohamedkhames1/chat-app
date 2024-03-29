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
    apiKey: 'AIzaSyDJeesmfFCL5QfZE5ZWokkVbonHZXtAvwo',
    appId: '1:783684897091:web:52176e7ca7b957c94687f6',
    messagingSenderId: '783684897091',
    projectId: 'scholer-chat-3bb0e',
    authDomain: 'scholer-chat-3bb0e.firebaseapp.com',
    storageBucket: 'scholer-chat-3bb0e.appspot.com',
    measurementId: 'G-P0XHYDX6XK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBgbyYgKLZMfsIixS_BnJQspeCAF_0eK-c',
    appId: '1:783684897091:android:4664319923f63dbb4687f6',
    messagingSenderId: '783684897091',
    projectId: 'scholer-chat-3bb0e',
    storageBucket: 'scholer-chat-3bb0e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzddpowGOOlXo6FEaM06d74Ew--Dy2hp0',
    appId: '1:783684897091:ios:f06747a2c46171f64687f6',
    messagingSenderId: '783684897091',
    projectId: 'scholer-chat-3bb0e',
    storageBucket: 'scholer-chat-3bb0e.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBzddpowGOOlXo6FEaM06d74Ew--Dy2hp0',
    appId: '1:783684897091:ios:f06747a2c46171f64687f6',
    messagingSenderId: '783684897091',
    projectId: 'scholer-chat-3bb0e',
    storageBucket: 'scholer-chat-3bb0e.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );
}
