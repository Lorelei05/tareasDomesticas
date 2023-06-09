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
    apiKey: 'AIzaSyA5cKoRL_R9rcH761Heo84FvECbyjWs6hs',
    appId: '1:390395613617:web:659184650a86e3c11e6d90',
    messagingSenderId: '390395613617',
    projectId: 'tareasdomesticas-f1a01',
    authDomain: 'tareasdomesticas-f1a01.firebaseapp.com',
    storageBucket: 'tareasdomesticas-f1a01.appspot.com',
    measurementId: 'G-WJYYRVJL3B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDRVrs28jrCliusHJMAm3D5CyKMmj9O2EY',
    appId: '1:390395613617:android:50dead8fac7338f01e6d90',
    messagingSenderId: '390395613617',
    projectId: 'tareasdomesticas-f1a01',
    storageBucket: 'tareasdomesticas-f1a01.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCWxvh29yR-ysb7HVQObaUdnevAR_WJgAM',
    appId: '1:390395613617:ios:d8c896988073e7771e6d90',
    messagingSenderId: '390395613617',
    projectId: 'tareasdomesticas-f1a01',
    storageBucket: 'tareasdomesticas-f1a01.appspot.com',
    iosClientId: '390395613617-4bhsol01a2f7c5lqhlf73j0m9jus1u7u.apps.googleusercontent.com',
    iosBundleId: 'com.example.tareas',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCWxvh29yR-ysb7HVQObaUdnevAR_WJgAM',
    appId: '1:390395613617:ios:d8c896988073e7771e6d90',
    messagingSenderId: '390395613617',
    projectId: 'tareasdomesticas-f1a01',
    storageBucket: 'tareasdomesticas-f1a01.appspot.com',
    iosClientId: '390395613617-4bhsol01a2f7c5lqhlf73j0m9jus1u7u.apps.googleusercontent.com',
    iosBundleId: 'com.example.tareas',
  );
}
