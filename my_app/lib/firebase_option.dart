
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyC-lyJ8pkar7_wxnyEhkWJaEjhsySs58mU',
    appId: '1:588602229327:android:abbcf8b15983e1fccee03a',
    messagingSenderId: '588602229327',
    projectId: 'pushnotification-f5369',
    authDomain: 'flutterproject-82c7e.firebaseapp.com',
    storageBucket: 'pushnotification-f5369.appspot.com',
    measurementId: 'G-1T8BR1TNST',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC-lyJ8pkar7_wxnyEhkWJaEjhsySs58mU',
    appId: '1:588602229327:android:abbcf8b15983e1fccee03a',
    messagingSenderId: '588602229327',
    projectId: 'pushnotification-f5369',
    storageBucket: 'pushnotification-f5369.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZwBBAt4nt30DBB03UYXR7TK7b2jKkMbk',
    appId: '1:760699802793:ios:ec5bd35d0c67fece9f05b8',
    messagingSenderId: '760699802793',
    projectId: 'flutterproject-82c7e',
    storageBucket: 'flutterproject-82c7e.appspot.com',
    iosBundleId: 'com.example.flutterApplicationDemo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDZwBBAt4nt30DBB03UYXR7TK7b2jKkMbk',
    appId: '1:760699802793:ios:46faf92b27ebfeeb9f05b8',
    messagingSenderId: '760699802793',
    projectId: 'flutterproject-82c7e',
    storageBucket: 'flutterproject-82c7e.appspot.com',
    iosBundleId: 'com.example.flutterApplicationDemo.RunnerTests',
  );
}