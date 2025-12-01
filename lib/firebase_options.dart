
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
    apiKey: 'AIzaSyANH3mFv5175Gx75RoQfxBwKQ3eMbo3RaM',
    appId: '1:620151795450:web:3cc088a2cca87adb6b2343',
    messagingSenderId: '620151795450',
    projectId: 'mycare-11bae',
    authDomain: 'mycare-11bae.firebaseapp.com',
    storageBucket: 'mycare-11bae.firebasestorage.app',
    measurementId: 'G-1G62JQZ7XE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCwg9N31g4K7nRk21PaJgLzAq8kAV6UzIg',
    appId: '1:620151795450:android:095c4f71b8180b806b2343',
    messagingSenderId: '620151795450',
    projectId: 'mycare-11bae',
    storageBucket: 'mycare-11bae.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD_RIbgMaW4uK4212MfNFSLrQ3O-xM_csM',
    appId: '1:620151795450:ios:8e42f2d5391a2f366b2343',
    messagingSenderId: '620151795450',
    projectId: 'mycare-11bae',
    storageBucket: 'mycare-11bae.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD_RIbgMaW4uK4212MfNFSLrQ3O-xM_csM',
    appId: '1:620151795450:ios:8e42f2d5391a2f366b2343',
    messagingSenderId: '620151795450',
    projectId: 'mycare-11bae',
    storageBucket: 'mycare-11bae.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyANH3mFv5175Gx75RoQfxBwKQ3eMbo3RaM',
    appId: '1:620151795450:web:a7023801237fd03b6b2343',
    messagingSenderId: '620151795450',
    projectId: 'mycare-11bae',
    authDomain: 'mycare-11bae.firebaseapp.com',
    storageBucket: 'mycare-11bae.firebasestorage.app',
    measurementId: 'G-SPZXW59KMZ',
  );
}
