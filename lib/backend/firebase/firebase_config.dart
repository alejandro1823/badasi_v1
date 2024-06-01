import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDeVeC_BPvW4QTS6C8RkyPbG2H1nFdcNU8",
            authDomain: "badasi-v1.firebaseapp.com",
            projectId: "badasi-v1",
            storageBucket: "badasi-v1.appspot.com",
            messagingSenderId: "468932195856",
            appId: "1:468932195856:web:839d0da2d445fced673c95"));
  } else {
    await Firebase.initializeApp();
  }
}
