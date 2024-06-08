import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAxod6Fjasn6rSZP4dVAO-KSjjSdmrN4Kw",
            authDomain: "cost-prognosis-5g3vg4.firebaseapp.com",
            projectId: "cost-prognosis-5g3vg4",
            storageBucket: "cost-prognosis-5g3vg4.appspot.com",
            messagingSenderId: "1090554257808",
            appId: "1:1090554257808:web:3f7aa9a6e0caadf7b59315"));
  } else {
    await Firebase.initializeApp();
  }
}
