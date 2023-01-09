import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDa4j0O8cMRUezRLZl-Ygw-3cefg8khF4o",
            authDomain: "mehndy-430c1.firebaseapp.com",
            projectId: "mehndy-430c1",
            storageBucket: "mehndy-430c1.appspot.com",
            messagingSenderId: "633100221769",
            appId: "1:633100221769:web:33102e673c5c4dd21fee98",
            measurementId: "G-ZLD9JPYEH5"));
  } else {
    await Firebase.initializeApp();
  }
}
