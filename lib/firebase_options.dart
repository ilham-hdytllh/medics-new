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
    apiKey: 'AIzaSyB-I8m6WtqrXtcN06_t92AZaovboa42-vY',
    appId: '1:928928943719:web:95441164cb2d7de5404ec2',
    messagingSenderId: '928928943719',
    projectId: 'tbr-medics',
    authDomain: 'tbr-medics.firebaseapp.com',
    storageBucket: 'tbr-medics.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBuA3kieUU-jBVVS46XEdaw0YPoN6SSbiY',
    appId: '1:928928943719:android:4e2d0be9b184362e404ec2',
    messagingSenderId: '928928943719',
    projectId: 'tbr-medics',
    storageBucket: 'tbr-medics.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBKR9q4b2oo45BB5P1awNZazGzRw3P3zH4',
    appId: '1:928928943719:ios:3912deb6db767136404ec2',
    messagingSenderId: '928928943719',
    projectId: 'tbr-medics',
    storageBucket: 'tbr-medics.firebasestorage.app',
    androidClientId: '928928943719-20nmd0rqgsni6lfbfk1okaj9vrqdot4v.apps.googleusercontent.com',
    iosClientId: '928928943719-12qedl1iior41s6ag9l6v4u7nllhjmpt.apps.googleusercontent.com',
    iosBundleId: 'id.web.tbalert.application',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBKR9q4b2oo45BB5P1awNZazGzRw3P3zH4',
    appId: '1:928928943719:ios:788e752afd74dcbc404ec2',
    messagingSenderId: '928928943719',
    projectId: 'tbr-medics',
    storageBucket: 'tbr-medics.appspot.com',
    iosBundleId: 'com.example.medics',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB-I8m6WtqrXtcN06_t92AZaovboa42-vY',
    appId: '1:928928943719:web:ccbafb64d4226791404ec2',
    messagingSenderId: '928928943719',
    projectId: 'tbr-medics',
    authDomain: 'tbr-medics.firebaseapp.com',
    storageBucket: 'tbr-medics.appspot.com',
  );
}