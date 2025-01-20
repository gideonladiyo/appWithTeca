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
    apiKey: 'AIzaSyDPkP5DSZvX-1z0XXdoL6HPyJkUfrymRUE',
    appId: '1:562289197341:web:7d5b9bf1813fe748d421f4',
    messagingSenderId: '562289197341',
    projectId: 'chatapp-dec67',
    authDomain: 'chatapp-dec67.firebaseapp.com',
    storageBucket: 'chatapp-dec67.firebasestorage.app',
    measurementId: 'G-NLD2EJ36MP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBbYIA2bNww-_UN3GOcXVsa795mMzVee4k',
    appId: '1:562289197341:android:fc941af5d26be376d421f4',
    messagingSenderId: '562289197341',
    projectId: 'chatapp-dec67',
    storageBucket: 'chatapp-dec67.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDcEPqA3OBDuRrBR19i6TXDHnpCOb3Iby4',
    appId: '1:562289197341:ios:604ecce97030c759d421f4',
    messagingSenderId: '562289197341',
    projectId: 'chatapp-dec67',
    storageBucket: 'chatapp-dec67.firebasestorage.app',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDcEPqA3OBDuRrBR19i6TXDHnpCOb3Iby4',
    appId: '1:562289197341:ios:604ecce97030c759d421f4',
    messagingSenderId: '562289197341',
    projectId: 'chatapp-dec67',
    storageBucket: 'chatapp-dec67.firebasestorage.app',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDPkP5DSZvX-1z0XXdoL6HPyJkUfrymRUE',
    appId: '1:562289197341:web:79b78b37efc3b417d421f4',
    messagingSenderId: '562289197341',
    projectId: 'chatapp-dec67',
    authDomain: 'chatapp-dec67.firebaseapp.com',
    storageBucket: 'chatapp-dec67.firebasestorage.app',
    measurementId: 'G-VMH3X3PTEV',
  );
}
