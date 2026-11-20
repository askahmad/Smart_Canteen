import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../firebase_options.dart';

class FirebaseService {
  static bool isFirebaseInitialized = false;

  static Future<void> init() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      isFirebaseInitialized = true;
      if (kDebugMode) {
        print("Firebase successfully initialized with project: smart-canteen-c2494");
      }
    } catch (e) {
      try {
        await Firebase.initializeApp();
        isFirebaseInitialized = true;
      } catch (err) {
        isFirebaseInitialized = false;
        if (kDebugMode) {
          print("Firebase initialization notice: $err");
        }
      }
    }
  }

  static FirebaseAuth? get auth =>
      isFirebaseInitialized ? FirebaseAuth.instance : null;

  static FirebaseFirestore? get firestore =>
      isFirebaseInitialized ? FirebaseFirestore.instance : null;
}
