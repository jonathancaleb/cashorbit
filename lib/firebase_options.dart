import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// A class that holds the default [FirebaseOptions] for different platforms.
///
/// This class provides a way to access the Firebase configuration options
/// based on the current platform (Web, Android, iOS). It retrieves the
/// necessary values from environment variables using the `flutter_dotenv` package.
class DefaultFirebaseOptions {
  /// Returns the current [FirebaseOptions] based on the platform.
  ///
  /// Throws an [UnsupportedError] if the platform is not supported.
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
            'DefaultFirebaseOptions are not supported for this platform.');
    }
  }

  /// Firebase options for the web platform.
  static FirebaseOptions web = FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_API_KEY_WEB']!,
    appId: dotenv.env['FIREBASE_APP_ID_WEB']!,
    messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID_WEB']!,
    projectId: dotenv.env['FIREBASE_PROJECT_ID_WEB']!,
    authDomain: dotenv.env['FIREBASE_AUTH_DOMAIN_WEB']!,
    storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET_WEB']!,
  );

  /// Firebase options for the Android platform.
  static FirebaseOptions android = FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_API_KEY_ANDROID']!,
    appId: dotenv.env['FIREBASE_APP_ID_ANDROID']!,
    messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID_ANDROID']!,
    projectId: dotenv.env['FIREBASE_PROJECT_ID_ANDROID']!,
    storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET_ANDROID']!,
  );

  /// Firebase options for the iOS platform.
  static FirebaseOptions ios = FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_API_KEY_IOS']!,
    appId: dotenv.env['FIREBASE_APP_ID_IOS']!,
    messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID_IOS']!,
    projectId: dotenv.env['FIREBASE_PROJECT_ID_IOS']!,
    storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET_IOS']!,
    iosBundleId: dotenv.env['FIREBASE_IOS_BUNDLE_ID']!,
  );
}
